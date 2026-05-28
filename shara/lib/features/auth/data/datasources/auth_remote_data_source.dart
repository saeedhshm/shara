import 'auth_data_source.dart';
import '../models/user_model.dart';
// Note: In real implementation, import AppApiHandler and AppUrls here

class AuthRemoteDataSourceImpl implements AuthDataSource {
  @override
  Future<void> sendConfirmCode(String phoneOrEmail) async {
    // TODO: Implement actual AppApiHandler call using loginSendConfirmCodeUrl
    throw UnimplementedError();
  }

  @override
  Future<UserDataModel> validateConfirmCode(String? phoneOrEmail, String confirmCode) async {
    // TODO: Implement actual AppApiHandler call using loginUrl
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: Implement actual AppApiHandler call using logoutUrl
    throw UnimplementedError();
  }
}
