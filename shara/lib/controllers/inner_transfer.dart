import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../helpers/utils/printutils.dart';
import 'init_app_controller.dart';

class InnerTransferController extends GetxController{

  var loading = false.obs;

  InitAppController appController = Get.find();

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

    if(phone.isNotEmpty && ammount.isNotEmpty){

      loading.value = true;
      var body = {
        'to':'${phone.substring(3)}',
        'amount':ammount
      } ;
      AppApiHandler.sendData(
          url: innerTransferUrl,
          body: body,
          header: {
            'Authorization' : 'bearer ${appController.userData.value.token.accessToken}' ,
            "x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
          callback: (json,stsCode) {
            println('---->>>> $json');
            loading.value = false;

            if(json['success']){
              Get.back();
              println('---- success = $json');
              SnackBars.showConfirmedSnackBar('success'.tr,json['message']);

            } else{
              println('---- failed = $json');
              SnackBars.showErrorSnackBar('failed'.tr, json['message']);
            }
          });
    }


  }
}