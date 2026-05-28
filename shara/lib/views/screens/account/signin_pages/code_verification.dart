import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/signin_pages/sign_up.dart';
import 'package:shara/views/widgets/main_button.dart';

import '../../../../controllers/sign_up_controller.dart';
import '../../../../helpers/app_colors.dart';
import '../../../../helpers/utils/widgets/sending_loading_widget.dart';
import '../../../widgets/four_digits_widget.dart';

class CodeVerificationPage extends StatefulWidget {
  const CodeVerificationPage({Key? key}) : super(key: key);

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {


  final textEditing1 = TextEditingController();
  final textEditing2 = TextEditingController();
  final textEditing3 = TextEditingController();
  final textEditing4 = TextEditingController();

  final SignUpController signUpController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {

    textEditing1.dispose();
    textEditing2.dispose();
    textEditing3.dispose();
    textEditing4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SendingLoadingDataWidget(
      isLoading: signUpController.loading.value,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainLightColor,
            elevation: 0,
            title: Text(
              'verification'.tr,
              style: TextStyle(
                  color: AppColors.mainDarkGreyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              maxLines: 3,
            ),
            leading: Container(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 50),
            child: Column(
              children: [
                Text(
                  'enter_code_from_mobile'.tr,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainDarkGreyColor),
                ),
                SizedBox(
                  height: 30,
                ),
                FourDigitWidget(textControllers: [textEditing1,textEditing2,textEditing3,textEditing4],),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('did_get_code?'.tr,style: TextStyle(
                        color: AppColors.fontLightGreyColor
                    ),),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        signUpController.sendRegisterPhone((arg1,arg2){});
                      },
                      child: Text('resent_again'.tr,style: TextStyle(
                          color: AppColors.mainGoldenDarkColor
                      ),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [



                    Expanded(child: MainButtonWidget(btnTitle: 'verify'.tr, onPressed: (){

                      // signUpController.confirmationCode = '${textEditing1.text}${textEditing2
                      //     .text}${textEditing3.text}${textEditing4.text}';
                      // println(signUpController.confirmationCode);
                      // return;
                      if(textEditing1.text.isEmpty || textEditing2.text.isEmpty || textEditing3.text.isEmpty || textEditing4.text.isEmpty) {
                        SnackBars.showErrorSnackBar('Error'.tr, 'enter_conf_code_correctly'.tr);
                      }else{
                        signUpController.confirmationCode = '${textEditing1.text}${textEditing2
                            .text}${textEditing3.text}${textEditing4.text}';
                        signUpController.validateConfirmationCode((arg1,arg2){
                          signUpController.loading.value = false;
                          if(arg1){

                            Get.to(()=>SignUpPage());
                          }else{
                            SnackBars.showErrorSnackBar('Error'.tr, arg2);
                          }
                        });
                      }
                      // signUpController.sendConfirmationCode();
                      // Get.to(()=>PasswordPage());
                    })),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
