class MyCoupnsManager {
  List<MyGiftCard> giftCards;
  bool success;
  String message;

  MyCoupnsManager({this.giftCards, this.success, this.message});

  fromJson(Map<String, dynamic> json) {
    if (json['gift_cards'] != null) {
      giftCards = <MyGiftCard>[];
      json['gift_cards'].forEach((v) {
        giftCards.add(new MyGiftCard.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

}

class MyGiftCard {
  int id;
  int resalId;
  int status;
  int customerId;
  int variantId;
  String referenceId;
  String code;
  String expireOn;
  String howToUse;
  String photo;
  String price;
  String totalPrice;
  String createdAt;
  String updatedAt;

  MyGiftCard(
      {this.id,
        this.resalId,
        this.status,
        this.customerId,
        this.variantId,
        this.referenceId,
        this.code,
        this.expireOn,
        this.howToUse,
        this.photo,
        this.price,
        this.totalPrice,
        this.createdAt,
        this.updatedAt});

  MyGiftCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resalId = json['resal_id'];
    status = json['status'];
    customerId = json['customer_id'];
    variantId = json['variant_id'];
    referenceId = json['reference_id'];
    code = json['code'];
    expireOn = json['expire_on'];
    howToUse = json['how_to_use'];
    photo = json['photo'];
    price = json['price'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
