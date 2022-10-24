import 'package:shara/helpers/apis_urls/app_urls.dart';

class Partner {
  int id;
  String _nameAr;
  String _nameEn;
  String _logo;
  String storeUrl;

  // Partner({this.id, this.nameAr, this.nameEn, this.logo, this.storeUrl});

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
    _logo = json['logo'];
    storeUrl = json['store_url'];
  }

  String partnerName(bool arabic){
    return arabic ? _nameAr : _nameEn;
  }

  String get logo{
    return '$partnerImage/$_logo';
  }
}
