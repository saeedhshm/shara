import 'package:get/get.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../helpers/utils/printutils.dart';

class InnerTransferController extends GetxController{

  var loading = false.obs;



  sendInnerTransfer(String phone,String ammount){

    var body = {
      'to':'$phone',
      'amount':ammount
    } ;


    AppApiHandler.sendData(
        url: innerTransferUrl,
        body: body,
        header: {"x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
        callback: (json,stsCode) {
          loading.value = false;
          println('---- success = ${json['success']}');
          if(json['success']){

          } else{



          }
        });
  }
}