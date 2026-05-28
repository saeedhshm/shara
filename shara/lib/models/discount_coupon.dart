import 'package:shara/helpers/utils/printutils.dart';

import '../helpers/apis_urls/app_urls.dart';

class CouponsManager {
  int? currentPage;
  List<Coupon> data = <Coupon>[];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;


  fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      // data
      json['data'].forEach((v) {
        data.add(new Coupon.fromJson(v));
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

class Coupon {
  int? id;
  String? _nameEn;
  String? _nameAr;
  String? _image;
  dynamic value;
  String? createdAt;
  String? updatedAt;



  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameEn = json['name_en'];
    _nameAr = json['name_ar'];
    _image = json['image'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  String get imageUrl{
    println('$discountCouponsImage/$_image');
    return '$discountCouponsImage/$_image';
  }

  String get code {
    return _nameEn ?? '';
  }

}
