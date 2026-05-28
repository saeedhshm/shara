import 'dart:convert';
import 'auth_data_source.dart';
import '../models/user_model.dart';

class AuthMockDataSourceImpl implements AuthDataSource {
  @override
  Future<void> sendConfirmCode(String phoneOrEmail) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    // Do nothing else, returning successfully implies code was "sent"
  }

  @override
  Future<UserDataModel> validateConfirmCode(String? phoneOrEmail, String confirmCode) async {
    await Future.delayed(Duration(seconds: 1));

    if (confirmCode == "1234") {
      final mockJsonStr = '''
      {
        "success": true,
        "token": {
          "access_token": "mock_access_token_12345",
          "token_type": "Bearer",
          "expires_in": 3600
        },
        "user": {
          "id": 1,
          "is_active": 1,
          "phone": "$phoneOrEmail",
          "points": "100.50",
          "email": "mockuser@example.com",
          "first_name": "Mock",
          "last_name": "User",
          "avatar": "",
          "gender": 1,
          "created_at": "2023-01-01T00:00:00.000000Z",
          "membership_type_id": 1,
          "membership": {
            "id": 1,
            "name_ar": "كلاسيك",
            "name_en": "Classic"
          }
        }
      }
      ''';
      return UserDataModel.fromJson(jsonDecode(mockJsonStr));
    } else {
      throw Exception("Invalid code");
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
