import 'package:get/get.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/models/user_model.dart';
import '../../../../controllers/init_app_controller.dart';
import '../../../../helpers/utils/printutils.dart';
import '../../../../helpers/utils/validation/validator.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final SendConfirmCodeUseCase sendConfirmCodeUseCase;

  LoginController(this.loginUseCase, this.sendConfirmCodeUseCase);

  InitAppController initAppController = Get.find();

  var isValidEmail = true.obs;
  var isValidPassword = true.obs;

  var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;

  var email = '';
  var password = '';
  var loading = false.obs;

  var confirmationCode = '';

  void sendConfirmCodeToPhoneAction(Function(String) onLogin) async {
    if (validateLoginFields()) {
      loading.value = true;
      var phoneOrEmail = int.tryParse(email)?.toString() ?? email;

      final result = await sendConfirmCodeUseCase(SendConfirmCodeParams(phoneOrEmail: phoneOrEmail));

      loading.value = false;
      
      result.fold(
        (failure) {
          println('--------->>>>>> error ${failure.message}');
          onLogin('phone_or_password_uncorrect'.tr);
        },
        (_) {
          onLogin('');
        }
      );
    }
  }

  void validateConfirmationCode(Function(bool, String) onDone) async {
    var phoneOrEmail = int.tryParse(email)?.toString() ?? email;
    loading.value = true;
    
    final result = await loginUseCase(LoginParams(phoneOrEmail: phoneOrEmail, confirmCode: confirmationCode));
    
    loading.value = false;

    result.fold(
      (failure) {
        onDone(false, 'code_not_correct_expired'.tr);
      },
      (userDataEntity) {
        // Assume userDataEntity is UserDataModel that can be saved
        initAppController.userData.value = userDataEntity as UserDataModel;
        // initAppController.userData.value.saveDataToStorage(); // Move this to UseCase or InitAppController later
        onDone(true, '');
      }
    );
  }

  bool validateLoginFields() {
    var validFields = true;
    int? num = int.tryParse(email);
    if (num != null) {
      if (!Validator.validatePhone(num)) {
        isValidEmail.value = false;
        validFields = false;
        emailErrorMessage.value = 'enter_valid_phone'.tr;
      } else {
        isValidEmail.value = true;
      }
    } else {
      isValidEmail.value = false;
      validFields = false;
      emailErrorMessage.value = 'email_phone_must_fill'.tr;
    }
    return validFields;
  }

  void logout({Function(bool)? onDone}) {
    // Implement using UseCase
    update();
    if (onDone != null) onDone(true);
  }
}
