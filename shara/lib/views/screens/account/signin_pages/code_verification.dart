import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/signin_pages/password_page.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/main_button.dart';

import '../../../../controllers/sign_up_controller.dart';
import '../../../../helpers/app_colors.dart';
import '../../../widgets/decorated_app_bar.dart';
import '../../../widgets/leading_back_arrow.dart';

class CodeVerificationPage extends StatefulWidget {
  const CodeVerificationPage({Key key}) : super(key: key);

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  final textEditing1 = TextEditingController();
  final textEditing2 = TextEditingController();
  final textEditing3 = TextEditingController();
  final textEditing4 = TextEditingController();

  final SignUpController signUpController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.requestFocus();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();

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
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // RawKeyboardListener( focusNode: _focusNode1,
                    //     onKey: (e){
                    //       println('------ e $e}');
                    //     }, child: SizedBox(width: 0,)),
                    Container(
                        width: 60,
                        height: 60,

                        child: CustomTextFormField(
                          textAlign: TextAlign.center,
                          controller: textEditing1,
                          keyboardType: TextInputType.number,
                          focusNode: _focusNode1,
                          inputFormatters:  [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          onChange: (value){
                            if(value.isNotEmpty){
                              FocusScope.of(context).requestFocus(_focusNode2);
                            }
                          },
                          // decoration: InputDecoration(
                          //
                          // ),
                        )
                    ),
                    Container(
                        width: 60,
                        height: 60,

                        child: CustomTextFormField(
                          textAlign: TextAlign.center,
                          controller: textEditing2,
                          focusNode: _focusNode2,

                          onChange: (value){

                            if(value.isNotEmpty){
                              FocusScope.of(context).requestFocus(_focusNode3);
                            }else if(textEditing2.text.isEmpty){
                              FocusScope.of(context).requestFocus(_focusNode1);
                            }
                          },
                          inputFormatters:  [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          keyboardType: TextInputType.number,
                          // decoration: InputDecoration(
                          //
                          // ),
                        )),
                    Container(
                        width: 60,
                        height: 60,
                        child: CustomTextFormField(
                          textAlign: TextAlign.center,
                          focusNode: _focusNode3,
                          controller: textEditing3,
                            inputFormatters:  [
                              LengthLimitingTextInputFormatter(1),
                            ],
                          onChange: (value){
                            if(value.isNotEmpty) {
                              FocusScope.of(context).requestFocus(_focusNode4);
                            }else if(textEditing3.text.isEmpty){
                              FocusScope.of(context).requestFocus(_focusNode2);
                            }
                          },
                          keyboardType: TextInputType.number,


                        )),
                    Container(
                        width: 60,
                        height: 60,
                        child: CustomTextFormField(
                          textAlign: TextAlign.center,

                          controller: textEditing4,
                          focusNode: _focusNode4,
                          inputFormatters:  [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          onChange: (String value){

                            if(value.isNotEmpty){
                              // FocusScope.of(context).unfocus();
                            }else if(textEditing4.text.isEmpty){
                              FocusScope.of(context).requestFocus(_focusNode3);
                            }
                          },
                          keyboardType: TextInputType.number,
                          // decoration: InputDecoration(
                          //
                          // ),
                        )),
                  ],
                ),
              ),
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
                  Text('resent_again'.tr,style: TextStyle(
                    color: AppColors.mainGoldenDarkColor
                  ),),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [

                  Expanded(child: MainButtonWidget(btnTitle: 'verify'.tr, onPressed: (){
                    if(textEditing1.text.isEmpty || textEditing2.text.isEmpty || textEditing3.text.isEmpty || textEditing4.text.isEmpty) {
                      showErrorSnackbar('Error'.tr, 'enter_conf_code_correctly'.tr);
                    }else{
                      var confCode = '${textEditing1.text}${textEditing2
                          .text}${textEditing3.text}${textEditing4.text}';
                      signUpController.validateConfirmationCode(confCode,(arg1,arg2){

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
    );
  }
}
