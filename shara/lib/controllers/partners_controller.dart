import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/partner.dart';

class PartnersController extends GetxController{
  List<Partner>  partners = [];

  var loading = false.obs;

  getAllPartners(){
    loading.value = true;
    AppApiHandler.getData(url: partnersUrl, callback: (json){
            for(var item in json){
              partners.add(Partner.fromJson(item));
              println(item);
              loading.value = false;
            }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllPartners();
  }

}