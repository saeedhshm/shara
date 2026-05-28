import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/change_account_information.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';
import 'package:shara/views/widgets/main_button.dart';

import 'change_password.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final InitAppController initAppController = Get.find();

  final changeInfo = Get.put(ChangeAccountInformation());

  final firstNameCtrl = TextEditingController();

  final secondNameCtrl = TextEditingController();

  final phoneCtrl = TextEditingController();

  final birthDateCtrl = TextEditingController();

  final genderCtrl = TextEditingController();

  // final emailCtrl = TextEditingController();
  //
  final passwordCtrl = TextEditingController();

  final secretNumberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

      firstNameCtrl.text = initAppController.userData.value.user!.firstName ?? '';
      secondNameCtrl.text = initAppController.userData.value.user!.lastName ?? '';
      phoneCtrl.text = '0${initAppController.userData.value.user!.phone}';
      // birthDateCtrl.text = '14/06/2020';
      genderCtrl.text =
      '${initAppController.userData.value.user!.points} ${'Point'.tr}';
      // emailCtrl.text = initAppController.userData.value.user.email;
      secretNumberCtrl.text = '123456';
      passwordCtrl.text = initAppController.userData.value.user!.password ?? '';
      return Scaffold(
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
            leading: LeadingBackArrow(
              size: 30,
              onBack: Get.back,
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
                  Text(
                    'account_setting'.tr,
                    style: TextStyle(
                        color: AppColors.mainDarkGreyColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  _rowItem('full_name'.tr, firstNameCtrl),
                  _rowItem('last_name'.tr, secondNameCtrl),
                  _rowItem('phone'.tr, phoneCtrl,readOnly: true),
                  _rowItem('points_count'.tr, genderCtrl),
                  // _rowItem('email'.tr, emailCtrl, suffix: true, onChange: () {
                  //
                  //   Go.to(context, ChangeEmail((message){
                  //     showConfirmedSnackbar('',message);
                  //     setState(() {
                  //
                  //     });
                  //   }));
                  // },readOnly: true),
                  _rowItem('password'.tr, passwordCtrl, suffix: true, onChange: () {
                    Go.to(context, ChangePasswordPage((message){
                    println('----========= onChangeDone');
                    SnackBars.showConfirmedSnackBar('',message);
                    setState(() {
                    });
                    }));
                  },readOnly: true,obscureText: true),
                  _rowItem('secret_number'.tr, secretNumberCtrl),
                  SizedBox(
                    height: 50,
                  ),
                  MainButtonWidget(btnTitle: 'save_changes'.tr, onPressed: () {
                    if(firstNameCtrl.text.isEmpty){
                      firstNameCtrl.text = initAppController.userData.value.user!.firstName ?? '';
                    }
                    if(secondNameCtrl.text.isEmpty){
                      secondNameCtrl.text = initAppController.userData.value.user!.lastName ?? '';
                    }

                    changeInfo.firstName = firstNameCtrl.text;
                    changeInfo.lastName = secondNameCtrl.text;

                    changeInfo.changeAccountInfo(initAppController.userData.value, (done,message){
                      println(done);
                      println(message);
                      if(done){
                        SnackBars.showConfirmedSnackBar('',message);
                      } else{
                        SnackBars.showErrorSnackBar('Error'.tr, message);
                      }
                    }) ;
                  })
                ],
              ),
            ),
          ),
        ),
      );

  }

  Widget _rowItem(String title, TextEditingController controller,
      {suffix = false, void Function()? onChange,readOnly = false,obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.fontLightGreyColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          // color: Colors.red,
          height: 30,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            textCapitalization: TextCapitalization.sentences,

            // enabled: enabled,
            readOnly: readOnly,
            style: TextStyle(
              height: 2.0,
            ),
            decoration: InputDecoration(
              hintText: title,
              contentPadding: EdgeInsets.only(bottom: 8),
              suffix: suffix
                  ? InkWell(
                    onTap:onChange,
                    child: Container(
                      // color: Colors.red,
                      child: Text(
                          'change'.tr,
                          style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,),
                        ),
                    ),
                  )
                  : null,
              //         floatingLabelStyle: TextStyle(
              //             color: AppColors.fontLightGreyColor ,
              //             fontWeight: FontWeight.bold ,
              //           fontSize: 20
              //         ) ,
              //         // contentPadding: EdgeInsets.only(top: 16),
              //
              //         label: Container(
              //           color: Colors.yellow,
              //
              //           child: Text(title,style: TextStyle(
              //     color: AppColors.fontLightGreyColor ,
              //     fontWeight: FontWeight.bold
              // ),),
              //         ),
              hintStyle: TextStyle(
                  color: AppColors.fontLightGreyColor,
                  fontWeight: FontWeight.bold),

              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.borderTextFieldColor)),
              focusColor: Colors.red,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainGoldenDarkColor)),
              border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.borderTextFieldColor)),
            ),
          ),
        ),
      ],
    );
  }
}
