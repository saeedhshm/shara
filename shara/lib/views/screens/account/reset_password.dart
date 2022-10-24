import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/reset_password_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/login_header.dart';
import 'package:shara/views/widgets/main_button.dart';

import 'login.dart';


class ResetNewPassword extends StatefulWidget {

   ResetNewPassword({Key key}) : super(key: key);

  @override
  State<ResetNewPassword> createState() => _ResetNewPasswordState();
}

class _ResetNewPasswordState extends State<ResetNewPassword> {
   final resetController = Get.find<ResetPasswordController>();

   final _passwordController = TextEditingController();

   final _confirmPasswordController = TextEditingController();

   final _codeController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Obx(()=>LoadingDataWidget(
      isLoading: resetController.loading.value,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: AppColors.mainLightColor,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              HeaderLoginWidget(
                height: 150,
                isLogin: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      'reset_password'.tr,
                      style: TextStyle(
                          color: AppColors.mainDarkGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Text('enter_emailed_code'.tr,style: TextStyle(
                                color: AppColors.mainLightGreyColor,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(
                              height: 35,
                            ),
                            CustomTextFormField(
                              controller: _codeController,
                              isValideField: resetController.isValidCode.value,
                              errorMessage:
                              resetController.codeErrorMessage.value,
                              hintText: 'enter_code'.tr,
                              labelText: 'code'.tr,

                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              errorMessage:  resetController.passwordErrorMessage.value,
                              isValideField:  resetController.isValidPassword.value,
                              hintText: '*******',
                              labelText: 'new_password'.tr,
                              icon: 'assets/images/icons/login/pass.png',
                              secureText: true,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              errorMessage:  resetController.confirmPasswordErrorMessage.value,
                              isValideField:  resetController.isValidConfirmPassword.value,
                              hintText: '*******',
                              labelText: 'new_confirm_password'.tr,
                              icon: 'assets/images/icons/login/pass.png',
                              secureText: true,
                            ),
                            SizedBox(
                              height: 35,
                            ),


                            MainButtonWidget(
                              btnTitle: 'send'.tr,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                resetController.code = _codeController.text;
                                resetController.confirmPassword = _confirmPasswordController.text;
                                resetController.password = _passwordController.text;

                                resetController.resetNewPasswordAction((done,message){
                                  println(done);
                                  println(message);
                                  if(done){
                                    showConfirmedSnackbar('',message);
                                    Go.toAndOff(context, LoginPage());
                                  } else{
                                    showErrorSnackbar('Error'.tr, 'invalid_code_entered'.tr);
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),

                          ],
                        )),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _codeController.dispose();
    Get.delete<ResetPasswordController>();
    super.dispose();
  }
}
