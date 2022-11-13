import 'package:flutter_pay/flutter_pay.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'dart:io' show Platform;
import '../helpers/apis_urls/api.dart';
import '../helpers/utils/printutils.dart';
import 'init_app_controller.dart';

class BuyPointsController extends GetxController{

  InitAppController appController = Get.find();
  var errorMessage = ''.obs;
  var canUseApplePay = false;


  generatePaymentUrl(String points,onDone){
    var params = {
      'points' : points,
    }  ;

    var headers = {
      'Authorization' : 'bearer ${appController.userData.value.token.accessToken}' ,
      "x-localization": 'lang_code'.tr,
    } ;
    AppApiHandler.sendData(url: urlPaymentGeneratorUrl, callback: (json,stsCode){
      println();
      println(json);
      println();
      if(json['success']){
       var paymentUrl = 'https://sharaksa.com/api/customer/payment/checkout-mobile-redirect?link=${json['url']}';
        onDone(paymentUrl);
      }
      // onChangeDone(json['success'],json['message']) ;
    }, body: params,header: headers);
  }

  void checkForApplePay() async{
    FlutterPay flutterPay = FlutterPay();
    println('-0-0-0-0-0->>> check_apple_pay');
    canUseApplePay = await flutterPay.canMakePaymentsWithActiveCard(allowedPaymentNetworks: [
      PaymentNetwork.visa,
      PaymentNetwork.masterCard,
      PaymentNetwork.mada,
    ]);
    println('-0-0-0-0-0->>> $canUseApplePay');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Platform.isIOS) {
      checkForApplePay();
    }else{
      println('-0-0-0-0-0->>> not Platform.isIOS');
    }
  }
}