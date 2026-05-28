import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/sign_up_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/signin_pages/password_page.dart';
import 'package:shara/views/screens/account/signin_pages/phone_page.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/login_header.dart';
import 'package:shara/views/widgets/main_button.dart';


class SignUpPage extends StatefulWidget {

   SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   final _fistNameController = TextEditingController();

   final _lastNameController = TextEditingController();


   SignUpController signUpController = Get.find();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // signUpController = Get.put(SignUpController());
    print('create ====>>>>> _SignUpPageState') ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: AppColors.mainLightColor,
        child: Column(
          children: [
            SizedBox(height: 30,),
            HeaderLoginWidget(height: 120, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  'create_account'.tr,
                  style: TextStyle(
                      color: AppColors.mainDarkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'data_record'.tr,
                  style: TextStyle(
                      color: AppColors.mainLightGreyColor, fontSize: 18),
                ),
                Spacer(),
              ],
            ),onClose: (){
              Get.back();
            },isLogin: false,pageName: 'SignUpPage',),
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(()=>Column(
                        children: [
                          CustomTextFormField(
                            isValideField: signUpController.isValidFirstName.value,
                            errorMessage:  signUpController.firstNameErrorMessage.value,
                            controller: _fistNameController,
                            hintText: 'enter_your_name'.tr,
                            labelText: 'full_name'.tr,
                            textCapitalization :  TextCapitalization.sentences,
                            icon: 'assets/images/icons/login/name.png',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                            isValideField: signUpController.isValidLastName.value,
                            errorMessage:  signUpController.lastNameErrorMessage.value,
                            controller: _lastNameController,
                            hintText: 'enter_last_name'.tr,
                            labelText: 'last_name'.tr,
                            textCapitalization :  TextCapitalization.sentences,
                            icon: 'assets/images/icons/login/name.png',
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          MainButtonWidget(btnTitle: 'sign_up'.tr, onPressed: () {


                            signUpController.isValidLastName.value = _lastNameController.text.isNotEmpty;
                            signUpController.isValidFirstName.value = _fistNameController.text.isNotEmpty;

                            if(_fistNameController.text.isEmpty){
                              signUpController.firstNameErrorMessage.value = 'enter_your_name'.tr;
                            }else{
                              signUpController.firstNameErrorMessage.value = '';
                            }
                            if(_lastNameController.text.isEmpty){
                              signUpController.lastNameErrorMessage.value = 'enter_last_name'.tr;
                            }else{
                              signUpController.lastNameErrorMessage.value = ''.tr;
                            }



                            if(signUpController.isValidLastName.value && signUpController.isValidFirstName.value) {
                              FocusScope.of(context).unfocus();
                              signUpController.firstName = _fistNameController.text;

                              signUpController.lastName = _lastNameController.text;
                              Go.to(context, PasswordPage(true,fromRegister: true,));
                            }
                            return;
                            signUpController.signUpAction((mssg,List<String> errors){
                              if(mssg == null){
                                Go.toAndOff(context, PhoneNumberPage());
                              } else{
                                var err = '';
                                for(var e in errors){
                                  println('----- err ${e.tr}');
                                  err += '\n${e.tr}';
                                }
                                // var err =  errors.join('\n');
                                SnackBars.showErrorSnackBar(mssg, '$err');
                              }
                            });
                          },) ,

                        ],
                      )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _lastNameController.dispose();

    _fistNameController.dispose();

    super.dispose();
  }
}
