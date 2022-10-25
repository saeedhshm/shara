import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/transaction_service.dart';
import 'package:shara/models/user_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'init_app_controller.dart';

class TransactionsController extends GetxController{
  var loading = false.obs;
  TransactionsService transactionsService = TransactionsService() ;

  InitAppController appController = Get.find();


  getAllTransactions(){
    loading.value = true;
    println('----->>>  all my transactions');
    var headers = {
      'Authorization' : 'bearer ${appController.userData.value.token.accessToken}' ,
      "x-localization": 'lang_code'.tr,
    } ;
    AppApiHandler.getData(url: myTransactionsUrl, header: headers,callback: (json){
      transactionsService.fromJson(json);
      loading.value = false;
    });

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
}