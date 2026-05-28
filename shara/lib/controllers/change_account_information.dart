import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/validation/validate_fields.dart';
import 'package:shara/features/auth/data/models/user_model.dart';

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

  void changeEmailAction(UserDataModel? userData,onChangeDone){

    String? emailValidation =  validateEmailField(email);
    String? passwordValidation = validatePassword(password,currentPassword: currentPassword);

     emailErrorMessage.value =  emailValidation ?? '';
     isValidEmail.value = false;
   
      passwordErrorMessage.value =  passwordValidation ?? '';
      isValidPassword.value = false;
   
     if(isValidPassword.value && isValidEmail.value){
       loading.value = true;
       var params = {
            'email':email,
         'currentPasswordEmail':password
       } ;
       var headers = {
         'Authorization' : 'bearer ${userData?.token?.accessToken}' ,
         "x-localization": 'lang_code'.tr,
       } ;
       ApiHandler.sendData(url: updateEmailUrl, callback: (json,stsCode){
         loading.value = false;
         userData?.user?.email = email;
         userData?.saveDataToStorage();
         onChangeDone(json['success'],json['message']) ;
       }, body: params,header: headers);
     }
  }

  void changeAccountInfo(UserDataModel? userData,onChangeDone){

    var params = {
      'first_name' : firstName,
      'last_name':lastName ,
      'phone' : userData?.user?.phone
    }  ;

    var headers = {
      'Authorization' : 'bearer ${userData?.token?.accessToken}' ,
      "x-localization": 'ar',
    } ;
    ApiHandler.sendData(url: updateProfileUrl, callback: (json,stsCode){
      loading.value = false;
      userData?.user?.firstName = firstName;
      userData?.user?.lastName = lastName;
      userData?.saveDataToStorage();

      onChangeDone(json['success'],json['message']) ;
    }, body: params,header: headers);
  }

  changePasswordAction(UserDataModel? userData,onChangeDone){
    String? passwordValidation = validatePassword(newPassword,currentPassword: null);
    String? currentPasswordValidation = validatePassword(currentPassword,currentPassword: userData?.user?.password);
    String? confirmedPasswordValidation = validateConfirmedPassword(confirmedPassword: confirmPassword,password: newPassword);


    newPasswordErrorMessage.value = passwordValidation ?? '';
    isValidNewPassword.value = false;
  
    currentPasswordErrorMessage.value = currentPasswordValidation ?? '';
    isValidCurrentPassword.value = false;
  
    confirmPasswordErrorMessage.value = confirmedPasswordValidation ?? '';
    isValidConfirmPassword.value = false;
  
    if(isValidCurrentPassword.value && isValidConfirmPassword.value && isValidNewPassword.value && userData != null){

      var params = {
           'currentPassword':  userData.user?.password,
        'password':newPassword,
        'confirmPassword':confirmPassword
      } ;
      var headers = {
        'Authorization' : 'bearer ${userData.token?.accessToken}' ,
        "x-localization": 'ar',
      } ;
      ApiHandler.sendData(url: updatePasswordUrl, callback: (json,stsCode){
        loading.value = false;
        userData.user?.password = newPassword;
        userData.saveDataToStorage();

        onChangeDone(json['success'],json['message']) ;
      }, body: params,header: headers);
    }  else{
      println('------- validation error ------');

    }

  }
}