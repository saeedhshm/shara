import 'package:shara/helpers/utils/printutils.dart';

class TransactionsService {
  List<Transaction> transactions = <Transaction>[];
  bool? success;
  String? message;

  // TransactionsService({this.transactions, this.success, this.message});

  fromJson(Map<String, dynamic> json) {

    // println(json);
    // return;
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        println('----------- transactions == null ${transactions == null}');

        transactions.add(new Transaction.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

}

class Transaction {
  int? id;
  String? uuid;
  int? customerId;
  int? companyId;
  int? _type;
  String? merchantOrderId;
  int? _status;
  dynamic amount;
  dynamic points;
  String? currency;
  String? redirectLink;
  String? createdAt;
  String? updatedAt;
  TransPartner? partner;
  PointsInfo? pointsInfo;

  String get type{
       return _type == 1 ? 'earning_points' : 'spending_points';
  }


  String get  status{
       return _status == 200 ? 'transaction_status_completed' :'transaction_status_not_completed';
  }

  String get transactionDate{
    var date = updatedAt!.split('T')[0].replaceAll('-', '/');

    return date;
  }

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    customerId = json['customer_id'];
    companyId = json['company_id'];
    _type = json['type'];
    merchantOrderId = json['merchant_order_id'];
    _status = json['status'];
    amount = json['amount'];
    points = json['points'];
    currency = json['currency'];
    redirectLink = json['redirect_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    partner =
    json['partner'] != null ? new TransPartner.fromJson(json['partner']) : null;
    pointsInfo = json['points_info'] != null
        ? new PointsInfo.fromJson(json['points_info'])
        : null;
  }

}

class TransPartner {
  int? id;
  String? name;
  int? isActive;
  String? logo;

  TransPartner({required this.id, required this.name, required this.isActive, required this.logo});

  TransPartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    logo = json['logo'];
  }

}

class PointsInfo {
  int? id;
  int? transactionId;
  dynamic points;
  dynamic pointsBefore;
  dynamic pointsAfter;
  String? createdAt;
  String? updatedAt;

  PointsInfo(
      {required this.id,
        required this.transactionId,
        this.points,
        this.pointsBefore,
        this.pointsAfter,
        required this.createdAt,
        required this.updatedAt});

  PointsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    points = json['points'];
    pointsBefore = json['points_before'];
    pointsAfter = json['points_after'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
