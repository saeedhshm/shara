import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';

class MemebershipService {
  Memberships? memberships;
  String? _introAr;
  String? _introEn;

  MemebershipService();

  fromJson(Map<String, dynamic> json) {
    memberships = json['memberships'] != null
        ? new Memberships.fromJson(json['memberships'])
        : null;
    _introAr = json['intro_ar'];
    _introEn = json['intro_en'];
  }

  String memberShipIntro(bool isArabic){
    return isArabic ? (_introAr ?? '') : (_introEn ?? '');
  }

  getMemberships(onDone){
    ApiHandler.getData(url: membershipUrl, callback: (json){
       this.fromJson(json);
       onDone();
    });
  }

}

class Memberships {
  int? currentPage;
  List<Membership>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Memberships(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Memberships.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Membership>[];
      json['data'].forEach((v) {
        data!.add(new Membership.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class Membership {
  int? id;
  String? _nameAr;
  String? _nameEn;
  String? _imageAr;
  String? _imageEn;
  List<Features>? features;
  String? _detailsAr;
  String? _detailsEn;

  Membership();

  cloneObject(Membership membership){
    features = membership.features;
    _detailsAr = membership._detailsAr;
    _detailsEn = membership._detailsEn;
  }

  String   name(bool arabic){
  return arabic ? (_nameAr ?? '') : (_nameEn ?? '');
}

String image(bool arabic){
  return '$membershipImage/${arabic ? _imageAr : _imageEn}';
}

String details(bool arabic){
    return arabic ? (_detailsAr ?? '') : (_detailsEn ?? '') ;
}
  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
    _imageAr = json['image_ar'];
    _imageEn = json['image_en'];
    _detailsAr = json['details_ar'];
    _detailsEn = json['details_en'];

    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

}


class Features {
  int? id;
  int? membershipTypesId;
  String? icon;
  String? _nameAr;
  String? _nameEn;

  String name(bool arabic){
    return arabic ? (_nameAr ?? '') : (_nameEn ?? '');
  }

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipTypesId = json['membership_types_id'];
    icon = json['icon'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
  }

}