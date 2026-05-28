import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<void> sendConfirmCode(String phoneOrEmail);
  Future<UserDataModel> validateConfirmCode(String phoneOrEmail, String confirmCode);
  Future<void> logout();
}
