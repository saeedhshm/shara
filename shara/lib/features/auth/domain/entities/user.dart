import 'package:flutter/material.dart';

class MembershipEntity {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  MembershipEntity({this.id, this.nameAr, this.nameEn});

  String mempName(bool isArabic) {
    return (isArabic ? nameAr : nameEn) ?? '';
  }

  Color get typeColor => Colors.black;

  String get typeBGImage => 'assets/images/holders/logo.png';
}

class UserEntity {
  final int? id;
  final int? isActive;
  final String? phone;
  final double? points;
  String? email;
  String? firstName;
  String? lastName;
  final String? avatar;
  final int? gender;
  final String? createdAt;
  final int? membershipTypeId;
  final MembershipEntity? membership;
  String? password;

  UserEntity({
    this.id,
    this.isActive,
    this.phone,
    this.points,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.gender,
    this.createdAt,
    this.membershipTypeId,
    this.membership,
    this.password,
  });
}

class TokenEntity {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  TokenEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });
}

class UserDataEntity {
  final bool? success;
  final TokenEntity? token;
  final UserEntity? user;

  UserDataEntity({
    this.success,
    this.token,
    this.user,
  });
}
