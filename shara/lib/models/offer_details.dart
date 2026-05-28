import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/models/partner.dart';

class OfferDetails {
  int? id;
  int? offersCategoriesId;
  int? usersCompaniesId;
  String? titleAr;
  String? titleEn;
  String? descAr;
  String? descEn;
  dynamic _imageAr;
  String? _imageEn;
  Partner? partner;
  OfferCategory? category;

  String title(bool isArabic){
    return (isArabic ? titleAr : titleEn) ?? '';
  }

  String description(bool isArabic){
    return (isArabic ? descAr : descEn) ?? '';
  }

  String image(bool isArabic){
    return isArabic ? '$offersImage/$_imageAr' : '$offersImage/$_imageEn';
  }

  //
  // OfferDetails(
  //     {this.id,
  //       this.offersCategoriesId,
  //       this.usersCompaniesId,
  //       this.titleAr,
  //       this.titleEn,
  //       this.descAr,
  //       this.descEn,
  //       this.imageAr,
  //       this.imageEn,
  //       this.partner,
  //       this.category});

  OfferDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offersCategoriesId = json['offers_categories_id'];
    usersCompaniesId = json['users_companies_id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    descAr = json['desc_ar'];
    descEn = json['desc_en'];
    _imageAr = json['image_ar'];
    _imageEn = json['image_en'];
    partner =
    json['partner'] != null ? new Partner.fromJson(json['partner']) : null;
    category = json['category'] != null
        ? new OfferCategory.fromJson(json['category'])
        : null;
  }

}


class OfferCategory {
  int? id;
  String? nameAr;
  String? nameEn;

  OfferCategory({required this.id, required this.nameAr, required this.nameEn});

  OfferCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }


}
