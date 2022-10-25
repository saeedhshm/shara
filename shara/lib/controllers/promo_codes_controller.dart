import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../models/promo_code.dart';
import '../models/promo_code_type.dart';
import 'init_app_controller.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class PromoCodeController extends GetxController {

  int page = 1;
  var promoCodeService = PromoCodesService().obs;
  var promocodeTypeService = PromoCodeType().obs;
  var loading = true.obs;
  var subLoading = false.obs;
  var selectedTypeId ;
  PromoCode promoCode;

  var buyingCode = false.obs;


  final InitAppController initAppController = Get.find();

  @override
  onInit() {
    super.onInit();
    _getPromoCodesTypes();
  }


  _getPromoCodesTypes(){
    println("--======================== inside promocode type func");
    final url = promoCodesTypesUrl;
    var headers = {
      'Authorization':
      'bearer ${initAppController.userData.value.token.accessToken}',
      "x-localization": 'lang_code'.tr,
    };
    println(url);
    println("--======================== inside promocode type func");

    AppApiHandler.getData(
        url: '$url',
        header: headers,
        callback: (json) {
          println(json);
          promocodeTypeService.value.fromJson(json);

          println(promocodeTypeService.value.productsTypes.length);

          println("--======================== selectedTypeId $selectedTypeId");
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
          'bearer ${initAppController.userData.value.token.accessToken}',
      "x-localization": 'lang_code'.tr,
    };

     println("--======================== selectedTypeId $url");
    AppApiHandler.getData(
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


  buyPromoCodePay(int variantId,onDone){

    // var desc = "اهدي من تحب بطاقة شحن رصيد لشركة موبايلي بالعديد من الفئات المختلفة معلومات البطاقة:يمكن إرسالها عبر: البريد الإلكتروني أو الرسائل النصية. قابلة للاستخدام في: شرائح موبايلي مسبقة الدفع\n<p>اهدي من تحب بطاقة شحن رصيد لشركة موبايلي بالعديد من الفئات المختلفة</p><p><br></p><p>معلومات البطاقة:</p><p>يمكن إرسالها عبر: البريد الإلكتروني أو الرسائل النصية</p><p>قابلة للاستخدام في: شرائح موبايلي مسبقة الدفع</p><p>ييتم تطبيق ضريبة القيمة المضافة عن طريق خصمها من الرصيد المبدئي من قبل شركة الاتصالات</p><p><br></p><p>طريقة الاستخدام:</p><p>1) كتابة الرقم *1400*</p><p>2) ادخال رقم البطاقة</p><p>3) الضغط على # ثم اتصال</p><p><br></p><p>شروط الاستخدام:</p><p>1) نوع الكود: رصيد يتم شحنه</p><p>2) يشمل الكود: جميع المنتجات.</p><p>4) هذه البطاقة متاحة للإستخدام في المتجر للدولة المختارة فقط ولايمكن استخدامها في متاجر أخرى.</p><p>5) هذه البطاقة غير قابلة للإسترجاع بعد شراءها ولا بعد انتهاءها.</p><p>6) لا تتحمل رسال أي مسؤولية عند فقدان القسيمة أو سرقتها أو استخدامها دون إذن.</p><p>7) يتم تفعيل الكود مباشرة عند الشراء.</p>";
    // var document = parse(desc);
    // print(document.body.text);
    //

    final url = buyPromoCodePayUrl;
    var headers = {
      'Authorization':
      'bearer ${initAppController.userData.value.token.accessToken}',
      "x-localization":'lang_code'.tr,
    };
    var body = {
      "gift_variants_id":"$variantId",
      "gift_variants_quantity" : "1",
      "gift_product_id" : "${promoCode.id}"
    };
    buyingCode.value = true;

    AppApiHandler.sendData(url: url, body: body,header: headers, callback: (json, stsCode){
      println(json["success"]);
      println(json["message"]);
      bool success = json["success"];
      String message = json["message"];

      var color = success ? Colors.green : Colors.red;
      if(success){
        message = json["mersal Order"]["message"];
        var document = parse(
            promoCode.description);
        onDone(document.body.text);
      }else{
        Get.snackbar("$success", "$message", backgroundColor: color,colorText: Colors.white);
      }

      buyingCode.value = false;

    });
  }
}
