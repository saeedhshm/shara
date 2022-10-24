import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/models/home_service.dart';

class HomeController extends GetxController{

  var showLogo = true.obs;
  var loading = true.obs;
  var homeData = HomeService().obs;

  @override
  void onInit() {
    super.onInit();
    loadingHomeData();
  }


  loadingHomeData(){
    AppApiHandler.getData(url: homePageUrl, callback: (json){

         homeData.value.fromJson(json);
         loading.value = false;
    });
  }



}