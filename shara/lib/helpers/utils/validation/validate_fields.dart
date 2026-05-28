import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

import '../printutils.dart';

String? validateEmailField(String? email,{String? currentEmail}){
  println('----->>>>>>>>>>. inside validateEmailField');
  println('----->>>>>>>>>>. inside email $email');
  if (email?.isEmpty ?? true) {
    return'email_must_fill'.tr;
  } else if (!EmailValidator.validate(email!)) {
    return 'enter_a_valid_email'.tr;
  }else if(email != currentEmail){
    return 'email_current_email_not_match'.tr;
  }
  return null;
}

String? validatePassword(String? password,{String? currentPassword}){
  if (password?.isEmpty ?? true) {
    return 'password_must_fill'.tr;
  } else if (password!.length < 4) {
    return 'password_less_than_6'.tr;
  }else if(password != currentPassword){
    return 'currentPassword_password_not_match'.tr;
  }
  return null;
}

String? validateConfirmedPassword({String? password, String? confirmedPassword}){
     if(confirmedPassword?.isEmpty ?? true){
       return 'confirm_password_empty'.tr;
     }else if(password != confirmedPassword){
       return 'confirm_password_not_match'.tr;
     }

     return null;
}

