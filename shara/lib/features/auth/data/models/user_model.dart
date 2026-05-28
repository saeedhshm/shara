import 'package:shara/helpers/utils/storage/handle_json.dart';
import '../../domain/entities/user.dart';

class MembershipModel extends MembershipEntity {
  MembershipModel({int? id, String? nameAr, String? nameEn})
      : super(id: id, nameAr: nameAr, nameEn: nameEn);

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    return MembershipModel(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
    };
  }
}

class UserModel extends UserEntity {
  UserModel({
    int? id,
    int? isActive,
    String? phone,
    double? points,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
    int? gender,
    String? createdAt,
    int? membershipTypeId,
    MembershipEntity? membership,
    String? password,
  }) : super(
          id: id,
          isActive: isActive,
          phone: phone,
          points: points,
          email: email,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
          gender: gender,
          createdAt: createdAt,
          membershipTypeId: membershipTypeId,
          membership: membership,
          password: password,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      isActive: json['is_active'],
      phone: json['phone'],
      points: double.tryParse('${json['points']}') ?? 0.0,
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      gender: json['gender'],
      createdAt: json['created_at'],
      membershipTypeId: json['membership_type_id'],
      membership: json['membership'] != null ? MembershipModel.fromJson(json['membership']) : null,
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_active': isActive,
      'phone': phone,
      'points': points,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'gender': gender,
      'created_at': createdAt,
      'membership_type_id': membershipTypeId,
      'membership': membership is MembershipModel ? (membership as MembershipModel).toJson() : null,
      'password': password,
    };
  }
}

class TokenModel extends TokenEntity {
  TokenModel({String? accessToken, String? tokenType, int? expiresIn})
      : super(accessToken: accessToken, tokenType: tokenType, expiresIn: expiresIn);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
    };
  }
}

class UserDataModel extends UserDataEntity {
  static const String _User_Key = "_User_Key";

  UserDataModel({bool? success, TokenEntity? token, UserEntity? user})
      : super(success: success, token: token, user: user);

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      success: json['success'],
      token: json['token'] != null ? TokenModel.fromJson(json['token']) : null,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'token': token is TokenModel ? (token as TokenModel).toJson() : null,
      'user': user is UserModel ? (user as UserModel).toJson() : null,
    };
  }

  void saveDataToStorage(){
    JsonHandler jsonHandler = JsonHandler(_User_Key);
    jsonHandler.writeJson(this.toJson());
  }

  Future<UserDataModel?> getDataFromStorage() async {
    var json = await JsonHandler(_User_Key).readJson();
    if (json != null) {
      return UserDataModel.fromJson(json);
    }
    return null;
  }

  Future<void> deleteUserFromStorage() async{
    JsonHandler jsonHandler = JsonHandler(_User_Key);
    jsonHandler.writeJson(null);
    await JsonHandler(_User_Key).deleteFile();
  }
}
