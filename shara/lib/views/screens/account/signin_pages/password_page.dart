import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../helpers/app_colors.dart';
import '../../../../helpers/utils/printutils.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/main_button.dart';
import 'confirm_password.dart';

class PasswordPage extends StatefulWidget {

  PasswordPage({Key key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  FocusNode _focusNode1 = FocusNode();

  FocusNode _focusNode2 = FocusNode();

  FocusNode _focusNode3 = FocusNode();

  FocusNode _focusNode4 = FocusNode();

  final textEditing1 = TextEditingController();

  final textEditing2 = TextEditingController();

  final textEditing3 = TextEditingController();

  final textEditing4 = TextEditingController();

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
            'create_password'.tr,
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
                          // decoration: InputDecoration(
                          //
                          // ),
                          //   inputFormatters:  [
                          //     LengthLimitingTextInputFormatter(1),
                          //   ]
                        )),
                    Container(
                        width: 60,
                        height: 60,
                        child: CustomTextFormField(
                          textAlign: TextAlign.center,
                          inputFormatters:  [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          controller: textEditing4,
                          focusNode: _focusNode4,

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

              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(child: MainButtonWidget(btnTitle: 'create'.tr, onPressed: (){
                    Get.to(()=>ConfirmPasswordPage());
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
