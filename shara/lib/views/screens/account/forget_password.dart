import 'package:flutter/material.dart';
import 'package:shara/controllers/login_controller.dart';
import 'package:shara/controllers/reset_password_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/sending_loading_widget.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/reset_password.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/login_header.dart';
import 'package:get/get.dart';
import 'package:shara/views/widgets/main_button.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final _emailController = TextEditingController();
  final loginController = Get.put(ResetPasswordController());

  ForgetPasswordWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SendingLoadingDataWidget(
        isLoading: loginController.loading.value,
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
                        'search_account'.tr,
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
                              Text(
                                'forget_password_instruction'.tr,
                                style: TextStyle(
                                    color: AppColors.mainLightGreyColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              CustomTextFormField(
                                controller: _emailController,
                                isValideField:
                                    loginController.isValidEmail.value,
                                errorMessage:
                                    loginController.emailErrorMessage.value,
                                hintText: 'enter_login_email'.tr,
                                labelText: 'login_email'.tr,
                                icon: 'assets/images/icons/login/email.png',
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              MainButtonWidget(
                                btnTitle: 'send'.tr,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  loginController.email = _emailController.text;
                                  loginController
                                      .forgetPasswordAction((done, message) {
                                    println(done);
                                    println(message);
                                    if (done) {
                                      showConfirmedSnackbar('', message);
                                      Go.to(context, ResetNewPassword());
                                    } else {

                                      showErrorSnackbar(
                                          'Error'.tr,message );
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Center(
                                    child: Text(
                                      'sign_in'.tr,
                                      style: TextStyle(
                                          color: AppColors.mainGoldenDarkColor),
                                    ),
                                  ),
                                ),
                              )
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
