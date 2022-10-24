class PromoCodeType {
  bool success;
  String message;
  List<ProductsTypes> productsTypes = <ProductsTypes>[];

  fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];

    if (json['productsTypes'] != null) {

      json['productsTypes'].forEach((v) {
        productsTypes.add(new ProductsTypes.fromJson(v));
      });
    }
  }

}

class ProductsTypes {
  int id;
  String name;
  String code;
  String description;
  bool selected = false;

  ProductsTypes({this.id, this.name, this.code, this.description});

  ProductsTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
  }

}
