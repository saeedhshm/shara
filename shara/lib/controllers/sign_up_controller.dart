import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/apis_urls/api_handler.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/validation/validator.dart';
import 'package:shara/features/auth/data/models/user_model.dart';

class SignUpController extends GetxController {

  // var isValidEmail = true.obs;
  var isValidPassword = true.obs;
  var isValidConfirmPassword = true.obs;
  var isValidFirstName = true.obs;
  var isValidLastName = true.obs;
  var isValidPhone = true.obs;
  // var isValidBirthDate = true.obs;

  // var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;
  var confirmPasswordErrorMessage = ''.obs;
  var firstNameErrorMessage = ''.obs;
  var lastNameErrorMessage = ''.obs;
  var phoneErrorMessage = ''.obs;


  // var email = '';
  var password = '';
  var confirmPassword = '';
  var phone = '';
  var firstName = '';
  var lastName = '';

  var loading = false.obs;

  var confirmationCode = '';

  void sendRegisterPhone(onLogin){
    int num = int.tryParse(phone) ?? 0;
    println(num);
    if (phone.isEmpty) {
      isValidPhone.value = false;

      phoneErrorMessage.value = 'phone_must_fill'.tr;
    } else if (!Validator.validatePhone(num)) {
      isValidPhone.value = false;

      phoneErrorMessage.value = 'enter_valid_phone'.tr;
    } else {
      isValidPhone.value = true;
      var body = {
        'phone':'$num',
      } ;
      loading.value = true;
      println('------------ send code');
      println(body);
      ApiHandler.sendData(
          url: sendConfirmCodeUrl,
          body: body,
          header: {"x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
          callback: (json,stsCode) {
            loading.value = false;
            if(stsCode == 200){
            //   {
            //     "success": true,
            // "confirmCode": "6307",
            // "message": "من فضلك ادخل البيانات المطلوبة بطريقة صحيحة"
            // }
              confirmationCode = json['confirmCode'];
              println(confirmationCode);
              onLogin(true,null);
            } else{

              InvalidUser invalidUser = InvalidUser.fromJson(json);
              // println(invalidUser.message);
              // println(invalidUser.validator?.errors);
              onLogin(false,invalidUser.validator?.errors) ;

            }
          });
    }
  }

  void validateConfirmationCode(onDone){
    var body = {
      'phone':phone,
      'code':confirmationCode
    } ;
    loading.value = true;
    println('------------ send code');
    println(body);
    println(confirmationCode);
    ApiHandler.sendData(
        url: validateConfirmCodeUrl,
        body: body,
        header: {"x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
        callback: (json,stsCode) {
          loading.value = false;
          if(stsCode == 200){
            //   {
            //     "success": true,
            // "confirmCode": "6307",
            // "message": "من فضلك ادخل البيانات المطلوبة بطريقة صحيحة"
            // }

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

  void signUpAction(onLogin) {


      loading.value = true;
      var body = {
         'first_name':firstName,
         'last_name':lastName,
        'phone':phone,
        'confirm_code':confirmationCode,
        'password':password  ,
        'confirmPassword'  :confirmPassword
      } ;

      println(body);
      ApiHandler.sendData(
          url: registerUrl,
          body: body,
          header: {"x-localization":'lang_code'.tr,'Content-Type':'application/x-www-form-urlencoded'},
          callback: (json,stsCode) {
            loading.value = false;
            println('--------->>>>>>>>>>>>>> register');
            println(json);
            println('--------->>>>>>>>>>>>>> register');
            if(stsCode == 200){
              InitAppController initApp = Get.find();
              initApp.userData.value = UserDataModel.fromJson(json);
              initApp.userData.value?.user?.password = password;
              initApp.userData.value?.saveDataToStorage();
              onLogin(null,null);
            } else{
              println('--------->>>>>> error message');
              InvalidUser invalidUser = InvalidUser.fromJson(json);
              onLogin(invalidUser.message,invalidUser.validator?.errors) ;
              println(invalidUser.message);
              println(invalidUser.validator?.errors);
              println('--------->>>>>> error message');
            }
          });

  }

 bool validateFields() {
    var validFields = true;
    // if (email.isEmpty) {
    //   isValidEmail.value = false;
    //   emailErrorMessage.value = 'email_must_fill'.tr;
    //   validFields = false;
    // } else if (!EmailValidator.validate(email)) {
    //   isValidEmail.value = false;
    //   validFields = false;
    //   emailErrorMessage.value = 'enter_a_valid_email'.tr;
    // } else {
    //   isValidEmail.value = true;
    // }

    if (firstName.isEmpty) {
      isValidFirstName.value = false;
      validFields = false;
      firstNameErrorMessage.value = 'name_must_fill'.tr;
    } else {
      isValidFirstName.value = true;
    }
    if (lastName.isEmpty) {
      isValidLastName.value = false;
      validFields = false;
      lastNameErrorMessage.value = 'last_name_must_fill'.tr;
    } else {
      isValidLastName.value = true;
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

    if(confirmPassword != password){
      isValidConfirmPassword.value = false;
      validFields = false;
      confirmPasswordErrorMessage.value = 'confirm_password_not_match'.tr;
    } else{
      isValidConfirmPassword.value = true;
    }
    int num = int.tryParse(phone) ?? 0;
    if (phone.isEmpty) {
      isValidPhone.value = false;
      validFields = false;
      phoneErrorMessage.value = 'phone_must_fill'.tr;
    } else if (!Validator.validatePhone(num)) {
      isValidPhone.value = false;
      validFields = false;
      phoneErrorMessage.value = 'enter_valid_phone'.tr;
    } else {
      isValidPhone.value = true;
    }

    return validFields;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    println('onInit ======= SignUpController');
  }

  @override
  // TODO: implement isClosed
  void onClose() {
    // TODO: implement onClose

    // isValidPhone.value = true;
    // isValidPassword.value = true;
    // isValidBirthDate.value = true;
    // isValidName.value = true;
    // isValidEmail.value = true;
    //
    //
    print('closed ======  ');
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    println( 'dispose ======= SignUpController');
    super.dispose();
  }
}


class InvalidUser {
  bool? success;
  ValidatorClass? validator;
  String? message;

  InvalidUser({this.success, this.validator, this.message});

  InvalidUser.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    validator = json['validator'] != null
        ? new ValidatorClass.fromJson(json['validator'])
        : null;
    message = json['message'];
  }


}





class ValidatorClass {
  List<String> errors = [];

  ValidatorClass.fromJson(Map<String, dynamic> json) {

    if(json['email'] != null ){
      errors.add(json['email'].cast<String>().first) ;
    }
    if(json['phone'] != null ) {
      errors.add(json['phone'].cast<String>().first);
    }
  }

}
