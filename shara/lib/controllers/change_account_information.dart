import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/validation/validate_fields.dart';
import 'package:shara/models/user_data.dart';

class ChangeAccountInformation extends GetxController{
  var loading = false.obs;

  var isValidEmail = true.obs;
  var emailErrorMessage = ''.obs;

  var isValidPassword = true.obs;
  var passwordErrorMessage = ''.obs;

  var isValidCurrentPassword = true.obs;
  var currentPasswordErrorMessage = ''.obs;

  var isValidNewPassword = true.obs;
  var newPasswordErrorMessage = ''.obs;

  var isValidConfirmPassword = true.obs;
  var confirmPasswordErrorMessage = ''.obs;

  String email = '';
  String password = '';

  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  String firstName = '';
  String lastName = '';

  void changeEmailAction(UserData userData,onChangeDone){

    String emailValidation =  validateEmailField(email);
    String passwordValidation = validatePassword(password,currentPassword: currentPassword);

     if( emailValidation != null){
       emailErrorMessage.value =  emailValidation;
       isValidEmail.value = false;
     }else{
       emailErrorMessage.value =  '';
       isValidEmail.value = true;
     }

     if(passwordValidation != null){
        passwordErrorMessage.value =  passwordValidation ;
        isValidPassword.value = false;
     }  else{
       isValidPassword.value = true;
     }

     if(isValidPassword.value && isValidEmail.value){
       loading.value = true;
       var params = {
            'email':email,
         'currentPasswordEmail':password
       } ;
       var headers = {
         'Authorization' : 'bearer ${userData.token.accessToken}' ,
         "x-localization": 'lang_code'.tr,
       } ;
       AppApiHandler.sendData(url: updateEmailUrl, callback: (json,stsCode){
         loading.value = false;
         userData.user.email = email;
         userData.saveDataToStorage();
         onChangeDone(json['success'],json['message']) ;
       }, body: params,header: headers);
     }
  }

  void changeAccountInfo(UserData userData,onChangeDone){

    var params = {
      'first_name' : firstName,
      'last_name':lastName ,
      'phone' : userData.user.phone
    }  ;

    var headers = {
      'Authorization' : 'bearer ${userData.token.accessToken}' ,
      "x-localization": 'ar',
    } ;
    AppApiHandler.sendData(url: updateProfileUrl, callback: (json,stsCode){
      loading.value = false;
      userData.user.firstName = firstName;
      userData.user.lastName = lastName;
      userData.saveDataToStorage();

      onChangeDone(json['success'],json['message']) ;
    }, body: params,header: headers);
  }

  changePasswordAction(UserData userData,onChangeDone){
    String passwordValidation = validatePassword(newPassword,currentPassword: null);
    String currentPasswordValidation = validatePassword(currentPassword,currentPassword: userData.user.password);
    String confirmedPasswordValidation = validateConfirmedPassword(confirmedPassword: confirmPassword,password: newPassword);


    if(passwordValidation != null){
      newPasswordErrorMessage.value = passwordValidation;
      isValidNewPassword.value = false;
    }else{
      newPasswordErrorMessage.value = '';
      isValidNewPassword.value = true;
    }

    if(currentPasswordValidation != null){
      currentPasswordErrorMessage.value = currentPasswordValidation;
      isValidCurrentPassword.value = false;
    }else{
      currentPasswordErrorMessage.value = '';
      isValidCurrentPassword.value = true;
    }

    if(confirmedPasswordValidation != null){
      confirmPasswordErrorMessage.value = confirmedPasswordValidation;
      isValidConfirmPassword.value = false;
    }else{
      confirmPasswordErrorMessage.value = '';
      isValidConfirmPassword.value = true;
    }

    if(isValidCurrentPassword.value && isValidConfirmPassword.value && isValidNewPassword.value){

      var params = {
           'currentPassword':  userData.user.password,
        'password':newPassword,
        'confirmPassword':confirmPassword
      } ;
      var headers = {
        'Authorization' : 'bearer ${userData.token.accessToken}' ,
        "x-localization": 'ar',
      } ;
      AppApiHandler.sendData(url: updatePasswordUrl, callback: (json,stsCode){
        loading.value = false;
        userData.user.password = newPassword;
        userData.saveDataToStorage();

        onChangeDone(json['success'],json['message']) ;
      }, body: params,header: headers);
    }  else{
      println('------- validation error ------');

    }

  }
}