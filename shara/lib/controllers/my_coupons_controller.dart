import 'package:get/get.dart';
import 'package:shara/models/my_coupons_manager.dart';

import '../helpers/apis_urls/api.dart';
import '../helpers/apis_urls/app_urls.dart';
import '../helpers/utils/printutils.dart';
import 'init_app_controller.dart';

class MyCouponsController extends GetxController{

  var loading = true.obs;
  InitAppController appController = Get.find();
  var myCoupons = MyCoupnsManager().obs;


  retrieveMyCoupons(){

      loading.value = true;
      println('----->>>  all my transactions');
      var headers = {
        'Authorization' : 'bearer ${appController.userData.value.token.accessToken}' ,
        "x-localization": 'ar',
      } ;
      AppApiHandler.getData(url: myCouponsUrl, header: headers,callback: (json){
        myCoupons.value.fromJson(json);
        loading.value = false;
      });



  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // retrieveMyCoupons();
  }
}