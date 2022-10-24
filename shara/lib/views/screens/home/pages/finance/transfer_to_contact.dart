import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/main_button.dart';

class TransferToContactPage extends StatelessWidget {

   TransferToContactPage({Key key}) : super(key: key);
   final transferToCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Row(
            children: [
              Text(
                'transfer_to_contact'.tr,
                style: TextStyle(
                    color: AppColors.mainDarkGreyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                maxLines: 3,
              ),
              Spacer(),
              InkWell(onTap: (){
                Get.back();
              },child: Icon(Icons.clear,color: Colors.black,size: 35,))
            ],
          ),
          leadingWidth: 16,
          leading: null),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.mainLightColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/icons/home/user.png',color: Colors.grey,),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${'balance'.tr} stcpay',style: TextStyle(
                              fontSize: 18,
                              color: AppColors.mainDarkGreyColor
                          ),),
                          SizedBox(height: 8,),
                          Text('650,00 ${'S.R'.tr}',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainDarkGreyColor
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                isValideField: true,
                errorMessage:  'signUpController.firstNameErrorMessage.value',
                controller: transferToCtrl,
                hintText: 'contact'.tr,
                labelText: 'contact'.tr,
                textCapitalization :  TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                isValideField: true,
                errorMessage:  'signUpController.firstNameErrorMessage.value',
                controller: transferToCtrl,
                hintText: '0.00'.tr,
                labelText: 'sum_to_transfer'.tr,
                textCapitalization :  TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(height: 20,),

              CustomTextFormField(
                isValideField: true,
                errorMessage:  'signUpController.firstNameErrorMessage.value',
                controller: transferToCtrl,
                hintText: 'reason_porpose'.tr,
                labelText: 'the_reason'.tr,
                textCapitalization :  TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(height: 20,),
              CustomTextFormField(
                isValideField: true,
                errorMessage:  'signUpController.firstNameErrorMessage.value',
                controller: transferToCtrl,
                hintText: 'add_info'.tr,
                labelText: 'notice'.tr,
                textCapitalization :  TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: Text('ensure_the_correct_iban_name_with_bank'.tr,style: TextStyle(
                    color: AppColors.fontLightGreyColor
                ),),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              MainButtonWidget(btnTitle: 'conform'.tr, onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
