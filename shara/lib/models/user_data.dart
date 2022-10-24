import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/storage/handle_json.dart';
import 'package:flutter/material.dart';

class UserData {
  bool success;
  Token token;
  User user;
  final String _User_Key = "_User_Key";

  UserData({this.success, this.token, this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    parsJson(json);
  }

  parsJson(Map<String, dynamic> json){
    success = json['success'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.token != null) {
      data['token'] = this.token.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }

    return data;
  }

  void saveDataToStorage(){
    JsonHandler jsonHandler = JsonHandler(_User_Key);
    jsonHandler.writeJson(this.toJson())   ;
  }

 Future getDataFromStorage() async {
    var json =  await JsonHandler(_User_Key).readJson();
    // println('json in userdata -------   $json');
    if(json != null){
      parsJson(json);
    }
  }

  Future deleteUserFromStorage() async{
    await JsonHandler(_User_Key).deleteFile();
  }
}

class Token {
  String accessToken;
  String tokenType;
  int expiresIn;

  Token({this.accessToken, this.tokenType, this.expiresIn});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class User {
  int id;
  int isActive;
  String phone;
  dynamic points;
  String email;
  String firstName;
  String lastName;
  String avatar;
  int gender;
  String _createdAt;
  String password;
  Membership membership;
  int membershipTypeId;
  User(
      {this.id,
        this.isActive,
        this.phone,
        this.points,
        this.email,
        this.firstName,
        this.lastName,
        this.membershipTypeId,
        this.avatar,
        this.gender,
        this.password,
  this.membership,});

  User.fromJson(Map<String, dynamic> json) {
    println('-=-==------------=-=- user');
    println(json);
    println('-=-==------------=-=- user');
    id = json['id'];
    isActive = json['is_active'];
    phone = json['phone'];
    points = json['points'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    gender = json['gender'];
    _createdAt = json['created_at'];
    password = json['password'];
    membershipTypeId = json['membership_type_id'];
    membership = json['membership'] != null
        ? new Membership.fromJson(json['membership'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['membership_type_id'] = this.membershipTypeId;
    data['phone'] = this.phone;
    data['points'] = this.points;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['created_at'] = this._createdAt;
    data['password'] = this.password;
    if (this.membership != null) {
      data['membership'] = this.membership.toJson();
    }
    return data;
  }

  String get createdAt{
    var date = _createdAt.split('T')[0].replaceAll('-', '/');

    return date;
  }
}
class Membership {
  int id;
  String _nameAr;
  String _nameEn;

  // Membership({this.id, this.nameAr, this.nameEn});

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _nameAr = json['name_ar'];
    _nameEn = json['name_en'];
  }

  MEMBERSHIP get membershipType{
    var name =  _nameEn.toLowerCase();
    return name.contains('Golden'.toLowerCase()) ? MEMBERSHIP.golden : name.contains('silver'.toLowerCase()) ? MEMBERSHIP.silver : name.contains('Platinum'.toLowerCase()) ?  MEMBERSHIP.platinum : MEMBERSHIP.classic;
  }
  
  Color get typeColor{
    // var name = 'Golden'.toLowerCase() ;
    switch(membershipType){
      case MEMBERSHIP.golden:
        return AppColors.goldColor;
      case MEMBERSHIP.silver:
        return AppColors.silverColor;
      case MEMBERSHIP.platinum:
        return AppColors.platinumColor;
      default:
        return AppColors.classicColor;
    }
    // return name.contains('Golden'.toLowerCase()) ? AppColors.gradiantGold : name.contains('silver'.toLowerCase()) ? AppColors.gradiantSilver : AppColors.gradiantPlatinum;
  }

  String get typeBGImage{
    // var name = 'Golden'.toLowerCase() ;
    switch(membershipType){
      case MEMBERSHIP.golden:
        return 'assets/images/membership_bg/golden.png';
      case MEMBERSHIP.silver:
        return 'assets/images/membership_bg/silver.png';
      case MEMBERSHIP.platinum:
        return 'assets/images/membership_bg/platin.png';
      default:
        return 'assets/images/membership_bg/classic.png';
    }
    // return name.contains('Golden'.toLowerCase()) ? AppColors.gradiantGold : name.contains('silver'.toLowerCase()) ? AppColors.gradiantSilver : AppColors.gradiantPlatinum;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this._nameAr;
    data['name_en'] = this._nameEn;
    return data;
  }

  String mempName(bool arabic){
    return arabic ? _nameAr : _nameEn;
  }


}

enum MEMBERSHIP{
  golden,silver,platinum,classic
}