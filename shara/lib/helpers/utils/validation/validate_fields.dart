import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

import '../printutils.dart';

String validateEmailField(String email,{String currentEmail}){
  println('----->>>>>>>>>>. inside validateEmailField');
  println('----->>>>>>>>>>. inside email $email');
  if (email.isEmpty) {
    return'email_must_fill'.tr;
  } else if (!EmailValidator.validate(email)) {
    return 'enter_a_valid_email'.tr;
  }else if(currentEmail != null && email != currentEmail){
    return 'email_current_email_not_match'.tr;
  }
  return null;
}

String validatePassword(String password,{String currentPassword}){
  if (password.isEmpty) {
    return 'password_must_fill'.tr;
  } else if (password.length < 8) {
    return 'password_less_than_6'.tr;
  }else if(currentPassword != null && password != currentPassword){
    return 'currentPassword_password_not_match'.tr;
  }
  return null;
}

String validateConfirmedPassword({String password, String confirmedPassword}){
     if(confirmedPassword == null || confirmedPassword.isEmpty){
       return 'confirm_password_empty'.tr;
     }else if(password != confirmedPassword){
       return 'confirm_password_not_match'.tr;
     }

     return null;
}

