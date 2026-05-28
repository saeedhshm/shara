import 'offer.dart';

class OffersService {
  List<Section> data = <Section>[];

  OffersService();

  fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {

      json['data'].forEach((v) {
        data.add(new Section.fromJson(v));
      });
    }
  }

 
}

class Section {
  int? id;
  String? _nameAr;
  String? _nameEn;
  String? nextLinke;
  List<Offer> offers = <Offer>[];

  String name(bool isArabic){
    return isArabic ? '$_nameAr' : '$_nameEn';
  }

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
    nextLinke = json['next_linke'];
    if (json['offers'] != null) {

      json['offers'].forEach((v) {
        offers.add(new Offer.fromJson(v));
      });
    }
  }

}


