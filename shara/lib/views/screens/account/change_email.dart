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

class ChangeEmail extends StatelessWidget{

        final Function onChange;
  ChangeEmail(this.onChange);
  final InitAppController initAppController = Get.find() ;
  final changeInfo = Get.find<ChangeAccountInformation>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

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
                    'change_email'.tr,
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
                          // Text('forget_password_instruction'.tr,style: TextStyle(
                          //     color: AppColors.mainLightGreyColor,
                          //     fontWeight: FontWeight.bold
                          // ),),
                          // SizedBox(
                          //   height: 35,
                          // ),
                          CustomTextFormField(
                            controller: _emailCtrl,
                            isValideField: changeInfo.isValidEmail.value,
                            errorMessage:
                            changeInfo.emailErrorMessage.value,
                            hintText: 'youremail@email.com',
                            labelText: 'new_email'.tr,
                            icon: 'assets/images/icons/login/email.png',
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          CustomTextFormField(
                            isValideField:
                            changeInfo.isValidPassword.value,
                            errorMessage:
                            changeInfo.passwordErrorMessage.value,
                            controller: _passwordCtrl,
                            hintText: '*******',
                            labelText: 'password'.tr,
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
                              changeInfo.email = _emailCtrl.text;
                              changeInfo.password = _passwordCtrl.text;
                              changeInfo.currentPassword = initAppController.userData.value.user.password;
                              changeInfo.changeEmailAction(initAppController.userData.value,(done,message){

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