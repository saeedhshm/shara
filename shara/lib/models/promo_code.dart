import 'package:get/get.dart';

class PromoCodesService {
  bool? success;
  String? message;
  List<PromoCode> promoCodes = <PromoCode>[].obs;


  fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['products'] != null) {

      json['products'].forEach((v) {
        promoCodes.add(new PromoCode.fromJson(v));
      });
    }
  }

}

class PromoCode {
  int? id;
  String? title;
  String? photo;
  String? description;
  dynamic beginPrice;
  bool? display;
  List<Variant>? variants;
  List<Types>? types;

  PromoCode(
      {required this.id,
        required this.title,
        required this.photo,
        required this.description,
        this.beginPrice,
        required this.display,
        required this.variants,
        required this.types});

  PromoCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photo = json['photo'];
    description = json['description'];
    beginPrice = json['begin_price'];
    display = json['display'];
    if (json['variants'] != null) {
      variants = <Variant>[];
      json['variants'].forEach((v) {
        variants!.add(new Variant.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return description ?? '';
  }

}

class Variant {
  int? id;
  dynamic value;
  dynamic price;
  dynamic vat;
  dynamic serviceFees;
  dynamic partnerFees;
  bool? display;
  Country? country;
  Stock? stock;

  Variant(
      {required this.id,
        this.value,
        this.price,
        this.vat,
        this.serviceFees,
        this.partnerFees,
        required this.display,
        required this.country,
        required this.stock});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    price = json['price'];
    vat = json['vat'];
    serviceFees = json['service_fees'];
    partnerFees = json['partner_fees'];
    display = json['display'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    stock = json['stock'] != null ? new Stock.fromJson(json['stock']) : null;
  }



}

class Country {
  int? id;
  String? name;
  String? fullName;
  String? code;
  String? flag;

  Country({required this.id, required this.name, required this.fullName, required this.code, required this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    code = json['code'];
    flag = json['flag'];
  }

}

class Stock {
  String? status;
  int? quantity;

  Stock({required this.status, required this.quantity});

  Stock.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    quantity = json['quantity'];
  }


}

class Types {
  int? id;
  String? name;
  String? code;
  String? description;

  Types({required this.id, required this.name, required this.code, required this.description});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
  }

}
