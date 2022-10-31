import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/utils/printutils.dart';
import 'init_app_controller.dart';

class BuyPointsController extends GetxController{

  InitAppController appController = Get.find();
  var errorMessage = ''.obs;

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

}