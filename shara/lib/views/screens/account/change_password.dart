import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/change_account_information.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/sending_loading_widget.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/login_header.dart';
import 'package:shara/views/widgets/main_button.dart';

class ChangePasswordPage extends StatelessWidget {

  final Function onChange;

   ChangePasswordPage(this.onChange);


   final changeInfo = Get.find<ChangeAccountInformation>();
   final _currentPasswordCtrl = TextEditingController();
   final _newPasswordCtrl = TextEditingController();
   final _confirmPasswordCtrl = TextEditingController();

  final InitAppController initAppController = Get.find() ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(()=>SendingLoadingDataWidget(isLoading: changeInfo.loading.value, child: Scaffold(
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
              isLogin: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    'change_password'.tr,
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

                          CustomTextFormField(
                            isValideField:
                            changeInfo.isValidCurrentPassword.value,
                            errorMessage:
                            changeInfo.currentPasswordErrorMessage.value,
                            controller: _currentPasswordCtrl,
                            hintText: '*******',
                            labelText: 'current_password'.tr,
                            icon: 'assets/images/icons/login/pass.png',
                            secureText: true,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          CustomTextFormField(
                            isValideField:
                            changeInfo.isValidNewPassword.value,
                            errorMessage:
                            changeInfo.newPasswordErrorMessage.value,
                            controller: _newPasswordCtrl,
                            hintText: '*******',
                            labelText: 'new_password'.tr,
                            icon: 'assets/images/icons/login/pass.png',
                            secureText: true,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          CustomTextFormField(
                            isValideField:
                            changeInfo.isValidConfirmPassword.value,
                            errorMessage:
                            changeInfo.confirmPasswordErrorMessage.value,
                            controller: _confirmPasswordCtrl,
                            hintText: '*******',
                            labelText: 'confirm_password'.tr,
                            icon: 'assets/images/icons/login/pass.png',
                            secureText: true,
                          ),
                          SizedBox(
                            height: 35,
                          ),


                          MainButtonWidget(
                            btnTitle: 'change'.tr,
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              changeInfo.currentPassword = _currentPasswordCtrl.text;
                              changeInfo.newPassword = _newPasswordCtrl.text;
                              changeInfo.confirmPassword = _confirmPasswordCtrl.text;

                              changeInfo.changePasswordAction(initAppController.userData.value,(done,message){

                                if(done){

                                  Get.back();
                                  onChange(message);
                                } else{
                                  showErrorSnackbar('Error'.tr, message);
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
    )));

  }
}
