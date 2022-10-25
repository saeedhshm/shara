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

  InitAppController initAppController = Get.find();

  // var isNewUser = true.obs;

  var isValidEmail = true.obs;
  var isValidPassword = true.obs;
  // var isValidConfirmPassword = true.obs;

  var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;
  // var confirmPasswordErrorMessage = ''.obs;

  var email = '';
  var password = '';
  var loading = false.obs;

  var confirmationCode = '';

  void sendConfirmCodeToPhoneAction(onLogin) {
    // if(initAppController.userData.value.user != null){
    //   email = (initAppController.userData.value.user?.email ?? '').split('@').first;
    // }

    if (validateLoginFields()) {
      loading.value = true;
      var phoneOrEmail = int.tryParse(email) ?? email;

      var body = {'phone': '$phoneOrEmail'};
      AppApiHandler.sendData(
          url: loginSendConfirmCodeUrl,
          body: body,
          header: {
            "x-localization": 'lang_code'.tr,
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          callback: (json, stsCode) {
            loading.value = false;
            println('----------------->>>>>>>>>>> login json');
            println('------>> login json \n$json\n');
            if (stsCode == 200) {

              // initAppController.userData.value = UserData.fromJson(json);
              // initAppController.userData.value.user.password = password;
              // initAppController.userData.value.saveDataToStorage();
              onLogin(null);
            } else {
              var message = 'phone_or_password_uncorrect'.tr;
              println('--------->>>>>> error $message');
              onLogin(message);

              println('--------->>>>>> error message');
            }
          });
    }
  }

  void validateConfirmationCode(onDone){

    var phoneOrEmail = int.tryParse(email) ?? email;
    println(phoneOrEmail);
    var body = {
      'phone':'$phoneOrEmail',
      'confirm_code':confirmationCode
    } ;
    loading.value = true;
    println('------------ send code');
    println(body);
    println(confirmationCode);
    AppApiHandler.sendData(
        url: loginUrl,
        body: body,
        header: {"x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
        callback: (json,stsCode) {
          loading.value = false;
          println('---- success = ${json['success']}');
          if(json['success']){
            initAppController.userData.value = UserData.fromJson(json);
            initAppController.userData.value.saveDataToStorage();
            onDone(true,null);
          } else{

            // InvalidUser invalidUser = InvalidUser.fromJson(json);
            // println(invalidUser.message);
            // println(invalidUser.validator.errors);
            var message = 'code_not_correct_expired'.tr;
            onDone(false,message) ;

          }
        });
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
      isValidEmail.value = false;
      validFields = false;
      emailErrorMessage.value = 'email_phone_must_fill'.tr;
    }

    // if (password.isEmpty) {
    //   isValidPassword.value = false;
    //   validFields = false;
    //   passwordErrorMessage.value = 'password_must_fill'.tr;
    // } else if (password.length < 4) {
    //   isValidPassword.value = false;
    //   validFields = false;
    //   passwordErrorMessage.value = 'password_less_than_6'.tr;
    // } else {
    //   isValidPassword.value = true;
    // }

    return validFields;
  }

  logout(
      {
      @required Function onDone}) async {

    // await initAppController.userData.value.deleteUserFromStorage();
    // initAppController.userData.value.user = null;
    // isNewUser.value = true;
    update();
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // isNewUser.value = initAppController.userData.value.user == null;
  }

}
