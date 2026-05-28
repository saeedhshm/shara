import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/models/offers_service.dart';

class AllOffersController extends GetxController{
  var allOffersService = OffersService().obs;
  var loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAllOffers();
  }

  loadAllOffers(){
    ApiHandler.getData(url: offersUrl, callback: (json){
      allOffersService.value.fromJson(json);
      loading.value = false;
    });
  }
}