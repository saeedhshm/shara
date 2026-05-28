import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:flutter/material.dart';
import '../helpers/apis_urls/api_handler.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../models/promo_code.dart';
import '../models/promo_code_type.dart';
import 'init_app_controller.dart';
import 'package:html/parser.dart' show parse;

class PromoCodeController extends GetxController {

  int page = 1;
  var promoCodeService = PromoCodesService().obs;
  var promocodeTypeService = PromoCodeType().obs;
  var loading = true.obs;
  var subLoading = false.obs;
  var selectedTypeId;
  PromoCode? promoCode;

  var buyingCode = false.obs;


  final InitAppController initAppController = Get.find();

  @override
  onInit() {
    super.onInit();
    _getPromoCodesTypes();
  }


  _getPromoCodesTypes(){

    final url = promoCodesTypesUrl;
    var headers = {
      'Authorization':
      'bearer ${initAppController.userData.value.token?.accessToken}',
      "x-localization": 'lang_code'.tr,
    };

    ApiHandler.getData(
        url: '$url',
        header: headers,
        callback: (json) {
          println(json);
          promocodeTypeService.value.fromJson(json);

          _getPromoCodes();
        });
  }

  Future onPullToRefresh() async{

    selectedTypeId = null;
    page = 1;
    loading.value = true;
    promoCodeService = PromoCodesService().obs;
    for(var type in promocodeTypeService.value.productsTypes){

        type.selected = false;

    }
    _getPromoCodes();
  }
  getSelectedTypePromoCodes(int typeId){
    selectedTypeId = typeId;
    page = 1;
    loading.value = true;
    promoCodeService = PromoCodesService().obs;
    _getPromoCodes();
  }
  _getPromoCodes() {

    final url = '$promoCodesUrl?page=$page&category=$selectedTypeId' ;
    var headers = {
      'Authorization':
          'bearer ${initAppController.userData.value.token?.accessToken}',
      "x-localization": 'lang_code'.tr,
    };

     println("--======================== selectedTypeId $url");
    ApiHandler.getData(
        url: url,
        header: headers,
        callback: (json) {
          promoCodeService.value.fromJson(json);
          loading.value = false;
          subLoading.value = false;
        });
  }

  loadMore(){
    subLoading.value = true;
    page += 1;
    _getPromoCodes();
  }


  buyPromoCodePay(int? variantId,onDone){

    if (promoCode == null) return;

    final url = buyPromoCodePayUrl;
    var headers = {
      'Authorization':
      'bearer ${initAppController.userData.value.token?.accessToken}',
      "x-localization":'lang_code'.tr,
    };
    var body = {
      "gift_variants_id":"$variantId",
      "gift_variants_quantity" : "1",
      "gift_product_id" : "${promoCode!.id}"
    };
    buyingCode.value = true;


    ApiHandler.sendData(url: url, body: body,header: headers, callback: (json, stsCode){
      buyingCode.value = false;
      if (json == null) return;
      
      println(json["message"]);
      bool success = json["success"];
      String message = json["message"];

      var color = success ? Colors.green : Colors.red;
      if(success){
        message = json["mersal Order"]["message"];
        var document = parse(
            promoCode!.description);
        onDone(document?.body?.text);
      }else{
        Get.snackbar("$success", "$message", backgroundColor: color,colorText: Colors.white);
      }

      buyingCode.value = false;

    });
  }
}
