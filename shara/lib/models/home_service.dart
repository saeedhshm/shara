import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/partner.dart';

import 'offer.dart';

class HomeService {
  String _introAr;
  String _introEn;
  List<Offer> offers = <Offer>[];
  List<Partner> partners = <Partner>[];
  List<Sliders> sliders = <Sliders>[];

  String intro(bool isArabic){
   return isArabic ? '$_introAr' : '$_introEn';
  }

  HomeService();
  fromJson(Map<String, dynamic> json) {

    _introAr = json['intro_ar'];
    _introEn = json['intro_en'];
    if (json['offers'] != null) {

      json['offers'].forEach((v) {
        offers.add(new Offer.fromJson(v));
      });
    }
    if (json['partners'] != null) {

      json['partners'].forEach((v) {
        partners.add(new Partner.fromJson(v));
      });
    }
    if (json['sliders'] != null) {

      json['sliders'].forEach((v) {
        sliders.add(new Sliders.fromJson(v));
      });
    }
  }

}





class Sliders {
  int id;
  String _imageAr;
  String _imageEn;

  String image(bool isArabic){
    println("--------------------- slider images");
    println('$slidersImage/$_imageAr');
    println("--------------------- slider images");
    return isArabic ? '$slidersImage/$_imageAr' : '$slidersImage/$_imageEn';
  }


  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _imageAr = json['image_ar'];
    _imageEn = json['image_en'];

  }


}
