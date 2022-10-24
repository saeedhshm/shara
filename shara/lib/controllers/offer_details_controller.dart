import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/models/offer_details.dart';

class OfferDetailsController extends GetxController{
  final int offerId;
  OfferDetails offerDetails;
  var loading = true.obs;

  OfferDetailsController(this.offerId);

  getOfferDetails(){
    AppApiHandler.getData(url: '$offersUrl/$offerId', callback: (json){

      offerDetails = OfferDetails.fromJson(json);
      loading.value = false;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOfferDetails();
  }
}