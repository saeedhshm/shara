import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/sign_up_controller.dart';
import '../../../../helpers/app_colors.dart';
import '../../../../helpers/navigation.dart';
import '../../../../helpers/utils/widgets/sending_loading_widget.dart';
import '../../../../helpers/utils/widgets/snack_bars.dart';
import '../../../widgets/four_digits_widget.dart';
import '../../../widgets/main_button.dart';
import '../../home/main_home_screen.dart';

class ConfirmPasswordPage extends StatefulWidget {

  const ConfirmPasswordPage({Key key}) : super(key: key);

  @override
  State<ConfirmPasswordPage> createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {



  final textEditing1 = TextEditingController();

  final textEditing2 = TextEditingController();

  final textEditing3 = TextEditingController();

  final textEditing4 = TextEditingController();

  SignUpController signUpController = Get.find();



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
    return SendingLoadingDataWidget(
      isLoading: signUpController.loading.value,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainLightColor,
            elevation: 0,
            title: Text(
              'confirm_password'.tr,
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

                SizedBox(
                  height: 30,
                ),
                FourDigitWidget(textControllers: [textEditing1,textEditing2,textEditing3,textEditing4],isPassword: true,),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [

                    Expanded(child: MainButtonWidget(btnTitle: 'confirm'.tr, onPressed: (){
                      signUpController.confirmPassword = '${textEditing1.text}${textEditing2
                          .text}${textEditing3.text}${textEditing4.text}';
                      if(textEditing1.text.isEmpty || textEditing2.text.isEmpty || textEditing3.text.isEmpty || textEditing4.text.isEmpty) {
                        SnackBars.showErrorSnackBar('Error'.tr, 'password_must_fill'.tr);
                      }else if(signUpController.confirmPassword != signUpController.password){

                        SnackBars.showErrorSnackBar('Error'.tr, 'confirm_password_not_match'.tr);
                        // Get.to(()=>ConfirmPasswordPage());
                      }else{
                        signUpController.signUpAction((arg1,arg2){
                          if(arg1 == null){
                            Go.toAndOff(context, MainHomeScreen());
                          }else{
                            SnackBars.showErrorSnackBar('Error'.tr, 'something_went_wrong'.tr);
                          }
                        });
                      }
                    })),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
