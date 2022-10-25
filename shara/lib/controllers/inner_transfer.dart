import 'package:get/get.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../helpers/utils/printutils.dart';

class InnerTransferController extends GetxController{

  var loading = false.obs;


  var errorMsgContactName = ''.obs;
  var errorMsgAmmount = ''.obs;

  sendInnerTransfer(String phone,String ammount){

    if(phone.isEmpty){
      errorMsgContactName.value = 'enter_contact_phone'.tr;
    }else{
      errorMsgContactName.value = '';
    }
    if(ammount.isEmpty){
      errorMsgAmmount.value = 'enter_valid_amount'.tr;
    }else{
      errorMsgAmmount.value = '';
    }
    return;
    if(phone.isNotEmpty && ammount.isNotEmpty){

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
}