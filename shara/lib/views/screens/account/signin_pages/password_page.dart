import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/views/screens/account/login/login.dart';

import '../../../../controllers/init_app_controller.dart';
import '../../../../controllers/sign_up_controller.dart';
import '../../../../helpers/app_colors.dart';
import '../../../../helpers/utils/printutils.dart';
import '../../../../helpers/utils/widgets/snack_bars.dart';
import '../../../widgets/four_digits_widget.dart';
import '../../../widgets/main_button.dart';
import '../../home/main_home_screen.dart';
import 'confirm_password.dart';

class PasswordPage extends StatefulWidget {

  final bool isFromLogin;
  final bool fromRegister;
  PasswordPage(this.isFromLogin,{Key? key,this.fromRegister = false}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {


  final textEditing1 = TextEditingController();

  final textEditing2 = TextEditingController();

  final textEditing3 = TextEditingController();

  final textEditing4 = TextEditingController();

  // SignUpController signUpController = Get.find();


  InitAppController initAppController = Get.find();


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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
           widget.isFromLogin ? 'create_password'.tr : 'password'.tr,
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
                  Expanded(child: MainButtonWidget(btnTitle:widget.isFromLogin ? 'create'.tr : 'sign_in'.tr, onPressed: (){

                    if(textEditing1.text.isEmpty || textEditing2.text.isEmpty || textEditing3.text.isEmpty || textEditing4.text.isEmpty) {
                      SnackBars.showErrorSnackBar('Error'.tr, 'password_must_fill'.tr);
                    }else{
                      var password = '${textEditing1.text}${textEditing2
                          .text}${textEditing3.text}${textEditing4.text}';
                      // println(signUpController.password);
                      if(widget.fromRegister){
                        SignUpController signUpController = Get.find();
                        signUpController.password = '${textEditing1.text}${textEditing2
                            .text}${textEditing3.text}${textEditing4.text}';
                        println(signUpController.password);
                        Get.to(()=>ConfirmPasswordPage());
                        return;
                      }

                      //////////////////////////////////////////
                      if(initAppController.userData.value.user!.password == '') {
                        initAppController.userData.value.user!.password = password;
                        initAppController.userData.value.saveDataToStorage();
                        println(initAppController.userData.value.user!.password);
                        Get.to(()=>MainHomeScreen());
                      }else if(initAppController.userData.value.user!.password == password){
                        Get.to(()=>MainHomeScreen());
                      }else {
                        // textEditing1.text = '';
                        // textEditing2.text = '';
                        // textEditing3.text = '';
                        // textEditing4.text = '';
                        SnackBars.showErrorSnackBar('Error'.tr, 'wrong_password'.tr);
                      }
                    }


                  })),

                ],
              ),
            widget.isFromLogin ? SizedBox() :  InkWell(
                onTap: (){
                  Go.toAndOff(context, LoginPage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('not_me'.tr,style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
