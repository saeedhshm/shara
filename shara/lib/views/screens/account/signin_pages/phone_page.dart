import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/screens/account/signin_pages/code_verification.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                isLogin: false,pageName: 'PhoneNumberPage',
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
                              keyboardType: TextInputType.phone,
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            MainButtonWidget(btnTitle: 'continue'.tr, onPressed: () {
                              FocusScope.of(context).unfocus();
                              // signUpController.loading.toggle();
                              signUpController.phone = int.tryParse(_phoneController.text).toString();
                              signUpController.sendRegisterPhone((arg1,arg2){
                                if(arg1) {
                                  Get.to(()=>CodeVerificationPage());
                                }else{
                                  SnackBars.showErrorSnackBar('Error'.tr, 'registered_number_login'.tr);
                                }
                              });

                            },) ,
                            SizedBox(
                              height: 30,
                            ),
                           Wrap(
                             crossAxisAlignment: WrapCrossAlignment.center,
                             alignment: WrapAlignment.center,
                             runSpacing: 8,
                             spacing: 5,
                             children: [
                               Text('by_presseing_continue'.tr,style: TextStyle(
                                 color: Colors.black54,
                                 fontSize: 15
                               ),),
                               InkWell(
                                 onTap: (){

                                   var url = 'https://sharaksa.com/terms-condition';
                                   if(Get.locale.languageCode == 'en'){
                                     url = 'https://sharaksa.com/en/terms-condition';
                                   }
                                   launchUrlString(url);
                                 },
                                 child: Text('terms_and_conditions'.tr,style: TextStyle(
                                   color: AppColors.mainGoldenDarkColor
                                 ),),
                               ),
                               Text('and'.tr,style: TextStyle(
                                   color: Colors.black54
                               ),),
                               InkWell(
                                 onTap: (){
                                   var url = 'https://sharaksa.com/privacy-policy';
                                   if(Get.locale.languageCode == 'en'){
                                     url = 'https://sharaksa.com/en/privacy-policy';
                                   }
                                   launchUrlString(url);
                                 },
                                 child: Text('privacy_policy'.tr,style: TextStyle(
                                     color: AppColors.mainGoldenDarkColor
                                 ),),
                               ),
                             ],
                           )

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
