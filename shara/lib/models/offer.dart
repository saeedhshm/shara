import 'package:shara/helpers/apis_urls/app_urls.dart';

class Offer {
  int? id;
  int? offersCategoriesId;
  int? usersCompaniesId;
  String? _titleAr;
  String? _titleEn;
  dynamic _imageAr;
  String? _imageEn;
  OfferPartner? partner;

  String title(bool isArabic){
    return isArabic ? '$_titleAr' : '$_titleEn';
  }

  String image(bool isArabic){
    return isArabic ? '$offersImage/$_imageAr' : '$offersImage/$_imageEn';
  }

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offersCategoriesId = json['offers_categories_id'];
    usersCompaniesId = json['users_companies_id'];
    _titleAr = json['title_ar'];
    _titleEn = json['title_en'];
    _imageAr = json['image_ar'];
    _imageEn = json['image_en'];
    partner =
    json['partner'] != null ? new OfferPartner.fromJson(json['partner']) : null;

  }

}


class OfferPartner {
  int? id;
  String? _nameAr;
  String? _nameEn;

  String name(bool isArabic){
    return isArabic ? '$_nameAr' : '$_nameEn';
  }

  OfferPartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
  }


}