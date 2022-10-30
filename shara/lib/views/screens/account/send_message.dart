import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/sending_loading_widget.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';
import 'package:shara/views/widgets/main_button.dart';

class SendMessagePage extends StatefulWidget {


  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final nameCtrl = TextEditingController();

  final phoneCtrl = TextEditingController();

  final messageCtrl = TextEditingController();

   final InitAppController initAppController = Get.find();

   bool loading = false;

   var validateMessageField = true;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCtrl.text = '${initAppController.userData.value.user.firstName} ${initAppController.userData.value.user.lastName}';
    phoneCtrl.text = '${initAppController.userData.value.user.phone}';
  }

   @override
  Widget build(BuildContext context) {
    return SendingLoadingDataWidget(
      isLoading: loading,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainLightColor,
            elevation: 0,
            title: Text(
              'account_info'.tr,
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
                child: LeadingBackArrow(
                  size: 30,
                ),
              ),
            )),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('send_message'.tr,style: TextStyle(
                      color: AppColors.mainDarkGreyColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 30,),
                  Text('name'.tr,
                    style: TextStyle(
                        color: AppColors.mainDarkGreyColor,
                        fontSize: 18
                    ),) ,
                  SizedBox(height: 15,),
                  CustomTextFormField(
                    // labelText: 'name'.tr,
                    readOnly: true,

                    hintText: 'name'.tr,
                    controller: nameCtrl,
                  ) ,
                  SizedBox(height: 25,),
                  Text('phone'.tr,
                    style: TextStyle(
                        color: AppColors.mainDarkGreyColor,
                        fontSize: 18
                    ),) ,
                  SizedBox(height: 15,),
                  CustomTextFormField(
                    // labelText: 'name'.tr,
                    readOnly: true,
                    hintText: 'phone'.tr,
                    controller: phoneCtrl,
                  ) ,
                  SizedBox(height: 25,),
                  Text('message'.tr,
                    style: TextStyle(
                        color: AppColors.mainDarkGreyColor,
                        fontSize: 18
                    ),) ,
                  SizedBox(height: 15,),
                  CustomTextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    errorMessage: 'this_field_must_fill'.tr,
                    isValideField: validateMessageField,
                    hintText: 'message'.tr,
                    controller: messageCtrl,
                    maxLines: 5,
                  ) ,
                  SizedBox(height: 50,),
                  MainButtonWidget(btnTitle: 'send'.tr, onPressed: (){

                    if(messageCtrl.text.isEmpty){
                      validateMessageField = false;
                      setState(() {

                      });
                      return;
                    } else{
                      validateMessageField = true;
                    }
                    loading = true;
                    setState(() {

                    });
                    initAppController.sendMessageAction(messageCtrl.text, (done,message){
                      loading  = false;
                      setState(() {

                      });
                      if(done){
                        SnackBars.showConfirmedSnackBar('',message);
                        Future.delayed(Duration(milliseconds: 2600),(){
                          Get.back(closeOverlays: true);
                        });
                      } else{
                        SnackBars.showErrorSnackBar('Error'.tr, message);
                      }
                    });
                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
