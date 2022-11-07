import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/inner_transfer.dart';
import 'package:shara/helpers/utils/printutils.dart';

import '../../../../../controllers/init_app_controller.dart';
import '../../../../../helpers/app_colors.dart';
import '../../../../../models/app_contact.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../../widgets/main_button.dart';

class TransferToContactPage extends StatelessWidget {

  bool readOnly = false;
  final AppContact contact;
  String _phone = '';

  final InnerTransferController controller = Get.put(InnerTransferController());

  TransferToContactPage({Key key, @required this.contact}) : super(key: key) {
    if(contact != null){
      _phone = contact.phone;
      transferToCtrl.text ='${contact.name} ($_phone)';
    }
    readOnly = transferToCtrl.text.isNotEmpty;
  }

  final transferToCtrl = TextEditingController();
  final reasonToCtrl = TextEditingController();
  final ammountCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

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
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 35,
                  ))
            ],
          ),
          leadingWidth: 16,
          leading: null),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(()=>Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.mainLightColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/icons/home/user.png',
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${'your_points'.tr}',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.mainDarkGreyColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${controller.appController.userData.value.user.points}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainDarkGreyColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                isValideField: controller.errorMsgContactName.value == '',
                errorMessage: controller.errorMsgContactName.value,
                controller: transferToCtrl,
                hintText: 'contact'.tr,
                labelText: 'contact'.tr,
                readOnly: readOnly,

                textCapitalization: TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                isValideField: controller.errorMsgAmmount.value == '',
                errorMessage: controller.errorMsgAmmount.value,
                controller: ammountCtrl,
                hintText: '0.00'.tr,
                labelText: 'points_to_transfer'.tr,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.sentences,
                // icon: 'assets/images/icons/login/name.png',
              ),
              SizedBox(
                height: 20,
              ),
              //
              // CustomTextFormField(
              //   isValideField: true,
              //   errorMessage: 'signUpController.firstNameErrorMessage.value',
              //   controller: reasonToCtrl,
              //   hintText: 'reason_porpose'.tr,
              //   labelText: 'the_reason'.tr,
              //   textCapitalization: TextCapitalization.sentences,
              //   // icon: 'assets/images/icons/login/name.png',
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // CustomTextFormField(
              //   isValideField: true,
              //   errorMessage: 'signUpController.firstNameErrorMessage.value',
              //   controller: notesCtrl,
              //   hintText: 'add_info'.tr,
              //   labelText: 'notice'.tr,
              //   textCapitalization: TextCapitalization.sentences,
              //   // icon: 'assets/images/icons/login/name.png',
              // ),
              // SizedBox(height: 16,),
              // SizedBox(
              //   width: double.infinity,
              //   child: Text('ensure_the_correct_iban_name_with_bank'.tr,style: TextStyle(
              //       color: AppColors.fontLightGreyColor
              //   ),),
              // ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              MainButtonWidget(btnTitle: 'conform'.tr, onPressed: () {
                var phone = '${int.tryParse(transferToCtrl.text)}';
                if(readOnly){
                  phone = '${contact.phone.substring(3)}';
                }
                controller.sendInnerTransfer(phone, ammountCtrl.text);
              })
            ],
          )),
        ),
      ),
    );
  }
}
