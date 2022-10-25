import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/login_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:shara/views/screens/account/account_information.dart';
import 'package:shara/views/screens/account/account_settings.dart';
import 'package:shara/views/screens/account/invoices_processes.dart';
import 'package:shara/views/screens/account/login/login.dart';
import 'package:shara/views/screens/account/send_message.dart';
import 'package:shara/views/screens/home/pages/settings/change_lang.dart';
import 'package:shara/views/screens/verfy_id/verify_id_controller.dart';
import 'package:shara/views/screens/verfy_id/verify_id_page.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';
import 'package:shara/views/widgets/main_button.dart';
import 'package:shara/views/widgets/open_container_widget.dart';

import '../../account/my_coupons.dart';

class ProfilePage extends StatelessWidget {

  ProfilePage({Key key,this.onBack}) : super(key: key);

  final Function onBack;
  final InitAppController initAppController = Get.find();
  final VerifyIDController verifyIDController = Get.put(VerifyIDController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'profile'.tr,
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          leading: Container(
            child: LeadingBackArrow(
              onBack: onBack,
              size: 30,
            ),
          )),
      body: Container(
        width: size.width,
        color: Colors.white,
        // color: AppColors.mainLightColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Obx(()=>
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // account info section
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child:OpenContainerWidget(
                                  closedWidget:  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/home/user.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'profile_info'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  openWidget: AccountInfoPage(),
                                )

                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child:OpenContainerWidget(
                                  closedWidget:  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/profile/verify_id/1.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'verify_id'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      verifyIDController.isVerifiedId.value ? Text('verified'.tr,style: TextStyle(
                                          color: Colors.green
                                      ),) : SizedBox()
                                    ],
                                  ),
                                  openWidget: verifyIDController.isVerifiedId.value ? null : VerifyIdPage(),
                                )

                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),


                            // account settings section
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child:OpenContainerWidget(
                                  closedWidget: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/profile/setting.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'account_setting'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  openWidget: AccountSettingsPage(),
                                )

                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),

                            //bills section
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: OpenContainerWidget(
                                  closedWidget: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/profile/money.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'proce_invoices'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  openWidget: InvoicesProcesses(),

                                )

                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),

                            // coupons sections
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: OpenContainerWidget(
                                  closedWidget: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/home/coupon.png',
                                        color: Colors.black,
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'my_coupons'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  openWidget: MyCouponsPage(),

                                )

                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),

                            //send message section
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child:OpenContainerWidget(
                                  closedWidget: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/profile/ask.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'send_message'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ) ,
                                  openWidget: SendMessagePage(),
                                )
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),

                            // change language section
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child:OpenContainerWidget(
                                  closedWidget: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/lang/lang.png',
                                        width: 35,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'change_lang'.tr,
                                        style: TextStyle(
                                            color: AppColors.mainDarkGreyColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ) ,
                                  openWidget: ChangeLanguagePage(),
                                )
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.mainLightColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButtonWidget(btnTitle: 'log_out'.tr, onPressed: (){
                  LoginController login = Get.find();
                  login.logout( onDone: (done){
                    if(done){
                      Go.toAndOff(context, LoginPage());
                    } else{
                      showErrorSnackbar('Error'.tr, 'there_is_wrong_somewhere'.tr);
                    }
                  }, );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
