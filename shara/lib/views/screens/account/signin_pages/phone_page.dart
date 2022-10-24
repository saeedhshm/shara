import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/screens/account/signin_pages/code_verification.dart';

import '../../../../controllers/sign_up_controller.dart';
import '../../../../helpers/app_colors.dart';
import '../../../../helpers/utils/widgets/sending_loading_widget.dart';
import '../../../../helpers/utils/widgets/snack_bars.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/login_header.dart';
import '../../../widgets/main_button.dart';

class PhoneNumberPage extends StatelessWidget {

  final SignUpController signUpController =  Get.put(SignUpController());
  final _phoneController = TextEditingController();

  PhoneNumberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SendingLoadingDataWidget(
      isLoading: signUpController.loading.value,
      child: Scaffold(
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
                    'welcome_to_shara'.tr,
                    style: TextStyle(
                        color: AppColors.mainDarkGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'code_will_be_received'.tr,
                    style: TextStyle(
                        color: AppColors.mainLightGreyColor, fontSize: 18),
                  ),
                  Spacer(),
                ],
              ),
              isLogin: true,
              //   onClose: (){
              //   // signUpController.onClose();   6:10 PM
              //   signUpController.dispose();
              //   signUpController.onClose();
              //   Get.delete<SignUpController>();
              // },
              ),
              Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(()=>Column(
                          children: [

                            CustomTextFormField(
                              controller: _phoneController,
                              errorMessage:  signUpController.phoneErrorMessage.value,
                              isValideField:  signUpController.isValidPhone.value,
                              hintText: '5XXXXXXXXX',
                              labelText: 'phone_number'.tr,
                              icon: 'assets/images/icons/login/phone.png',
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            MainButtonWidget(btnTitle: 'continue'.tr, onPressed: () {
                              FocusScope.of(context).unfocus();
                              println('ggggggggggggggg');
                              // signUpController.loading.toggle();
                              signUpController.phone = int.tryParse(_phoneController.text).toString();
                              signUpController.sendRegisterPhone((arg1,arg2){
                                if(arg1) {
                                  Get.to(()=>CodeVerificationPage());
                                }else{
                                  showErrorSnackbar('Error'.tr, 'registered_number_login'.tr);
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
      ),
    ));
  }
}
