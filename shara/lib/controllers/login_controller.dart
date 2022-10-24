import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/validation/validator.dart';
import 'package:shara/models/user_data.dart';

import 'init_app_controller.dart';

class LoginController extends GetxController {
  var isValidEmail = true.obs;
  var isValidPassword = true.obs;
  // var isValidConfirmPassword = true.obs;

  var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;
  // var confirmPasswordErrorMessage = ''.obs;

  var email = '';
  var password = '';
  var loading = false.obs;

  void loginAction(onLogin) {
    if (validateLoginFields()) {
      loading.value = true;
      var phoneOrEmail = int.tryParse(email) ?? email;
      var body = {'phone': '$phoneOrEmail', 'password': password};
      AppApiHandler.sendData(
          url: loginUrl,
          body: body,
          header: {
            "x-localization": 'ar',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          callback: (json, stsCode) {
            loading.value = false;
            println('------>> login json \n$json\n');
            if (stsCode == 200) {
              InitAppController initApp = Get.find();
              initApp.userData.value = UserData.fromJson(json);
              initApp.userData.value.user.password = password;
              initApp.userData.value.saveDataToStorage();
              onLogin(null);
            } else {
              var message = json['message'];
              println('--------->>>>>> error $message');
              onLogin(message);

              println('--------->>>>>> error message');
            }
          });
    }
  }

  bool validateLoginFields() {
    var validFields = true;
    int num = int.tryParse(email);
    if (num != null) {
      if (!Validator.validatePhone(num)) {
        isValidEmail.value = false;
        validFields = false;
        emailErrorMessage.value = 'enter_valid_phone'.tr;
      } else {
        isValidEmail.value = true;
      }
    } else {
      if (email.isEmpty) {
        isValidEmail.value = false;
        validFields = false;
        emailErrorMessage.value = 'email_phone_must_fill'.tr;
      } else if (!EmailValidator.validate(email)) {
        isValidEmail.value = false;
        validFields = false;
        emailErrorMessage.value = 'enter_a_valid_email'.tr;
      } else {
        isValidEmail.value = true;
      }
    }

    if (password.isEmpty) {
      isValidPassword.value = false;
      validFields = false;
      passwordErrorMessage.value = 'password_must_fill'.tr;
    } else if (password.length < 8) {
      isValidPassword.value = false;
      validFields = false;
      passwordErrorMessage.value = 'password_less_than_6'.tr;
    } else {
      isValidPassword.value = true;
    }

    return validFields;
  }

  logout(
      {@required UserData userData,
      @required Function onDone}) async {

    await userData.deleteUserFromStorage();
    onDone(true);
    // AppApiHandler.sendData(
    //     url: logoutUrl,
    //     body: {'email': userData.user.email, 'password': userData.user.password},
    //     header: {
    //       "x-localization": 'ar',
    //       'Authorization' : '${userData.token.tokenType} ${userData.token.accessToken}',
    //       'Content-Type': 'application/x-www-form-urlencoded'
    //     },
    //     callback: (json, stsCode) {
    //       loading.value = false;
    //       println('------>> login json \n$json\n');
    //       if (stsCode == 200) {
    //         onDone(true);
    //       } else {
    //         onDone(false);
    //       }
    //     });
  }


}
