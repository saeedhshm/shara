import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';

import '../helpers/utils/validation/validator.dart';

class ResetPasswordController extends GetxController{

  String email = '';
  String code = '';
  String password = '';
  String confirmPassword = '';

  var isValidEmail = true.obs;
  var isValidCode = true.obs;
  var isValidPassword = true.obs;
  var isValidConfirmPassword = true.obs;

  var emailErrorMessage = ''.obs;
  var codeErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;
  var confirmPasswordErrorMessage = ''.obs;

  var loading = false.obs;


  forgetPasswordAction(onDone){
    // if (email.isEmpty) {
    //   isValidEmail.value = false;
    //   emailErrorMessage.value = 'email_must_fill'.tr;
    //   return;
    // } else if (!EmailValidator.validate(email)) {
    //   isValidEmail.value = false;
    //   emailErrorMessage.value = 'enter_a_valid_email'.tr; كطزظو\جحجططططززحككك
    //   return;
    // } else {
    //   isValidEmail.value = true;
    // }

    int? phoneNum = int.tryParse(email);
    if (!Validator.validatePhone(phoneNum ?? 0)) {
      isValidEmail.value = false;
      emailErrorMessage.value = 'enter_valid_phone'.tr;
      return;
    } else {
      isValidEmail.value = true;
    }
  
    var fieldKey = 'email';
    var url = forgetPasswordByEmailUrl;

    url = forgetPasswordByPhoneUrl;
    fieldKey = 'phone';
  
    loading.value = true;
    ApiHandler.sendData(
        url: url,
        body: {'$fieldKey': email},
        header: {
          "x-localization": 'lang_code'.tr,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        callback: (json, stsCode) {
          loading.value = false;
          println('------>> login json \n$json\n');
          if(json['success']) {
            onDone(true,json['message']);
          }else {
            var errorMessage = 'email_not_found'.tr;
            errorMessage = 'phone_not_found'.tr;
                      onDone(false,errorMessage);
          }
        });
  }

  resetNewPasswordAction(onDone){
    var validateFields = true;
    if(code.isEmpty){
      isValidCode.value = false;
      codeErrorMessage.value = 'Enter_code_error_message'.tr;
      validateFields = false;
    }else{
      isValidCode.value = true;
    }

    if (password.isEmpty) {
      isValidPassword.value = false;
      passwordErrorMessage.value = 'password_must_fill'.tr;
      validateFields = false;
    } else if (password.length < 8) {
      isValidPassword.value = false;
      passwordErrorMessage.value = 'password_less_than_6'.tr;
      validateFields = false;
    } else {
      isValidPassword.value = true;
    }


    if (confirmPassword.isEmpty) {
      isValidConfirmPassword.value = false;
      confirmPasswordErrorMessage.value = 'password_must_fill'.tr;
      validateFields = false;
    } else if(confirmPassword != password){
      isValidConfirmPassword.value = false;
      confirmPasswordErrorMessage.value = 'confirm_password_not_match'.tr;
      validateFields = false;
    } else{
      isValidConfirmPassword.value = true;
    }
    if(!validateFields)
      return;

    loading.value = true;
    ApiHandler.sendData(
        url: resetPasswordUrl,
        body: {'code': code,'password':password,'confirmPassword':confirmPassword},
        header: {
          "x-localization": 'lang_code'.tr,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        callback: (json, stsCode) {
          loading.value = false;
          println('------>> login json \n$json\n');
          onDone(json['success'],json['message']);
        });

  }


}