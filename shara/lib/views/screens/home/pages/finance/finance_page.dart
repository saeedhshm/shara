import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/screens/home/pages/finance/local_tranfer.dart';
import 'package:shara/views/screens/home/pages/finance/transfer_to_contact.dart';
import 'package:shara/views/screens/home/pages/finance/widgets/bottom_sheet.dart';
import 'package:shara/views/screens/home/pages/finance/widgets/finance_page_item.dart';

import '../../../../../controllers/buy_points_controller.dart';
import '../../../../widgets/flat_botton.dart';
import 'choose_beneficiary.dart';
import 'contacts.dart';

class FinancePage extends StatelessWidget {

  final Function onBack;
   FinancePage({Key key,this.onBack}) : super(key: key);

   InitAppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'finance'.tr,
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          leading: Container(
            child: InkWell(
              onTap: onBack,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          )),
      body: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.mainLightColor,
          child: Column(
            children: [
              // 01226973508
              // 0963321300

              Expanded(child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),

                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Text('current_balance'.tr,style: TextStyle(
                                  color: AppColors.mainGoldenDarkColor,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold
                              )),
                              SizedBox(height: 16,),
                              Text('${appController.userData.value.user.points} ${'Point'.tr}',style: TextStyle(
                                color: AppColors.mainGoldenDarkColor,
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white, //AppColors.peageColor.withOpacity(0.3),
                          border: Border.all(color: AppColors.goldColor,width: 1),
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      SizedBox(height: 16,),
                      Wrap(children: [
                        InkWell(
                          onTap: (){
                            Get.put(BuyPointsController());
                            Get.bottomSheet(
                              BottomSheetWidget()
                            );
                          },
                            child: FinancePageItemWidget(title: 'add_balance'.tr, imageIcon: 'assets/images/icons/finance_icons/2.png')),
                        GestureDetector(onTap: (){
                          Get.to(()=>ContactsPage());
                        },child: FinancePageItemWidget(title: 'transfer_points'.tr, imageIcon: 'assets/images/icons/finance_icons/8.svg',)),
                        InkWell(onTap: (){
                          // Get.to(()=>ChooseBeneficiaryPage());
                          Get.defaultDialog(
                            title: "".tr,
                            middleText: "verify_your_id".tr,
                            middleTextStyle:  TextStyle(
                                color: Colors.red,
                                fontSize: 18
                            ),
                            titleStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 18
                            ),
                            confirm:   FlatButton(
                              child:  Text("press_to_verify_id".tr,style: TextStyle(
                                  color: Colors.white
                              ),),
                              color: AppColors.mainGoldenDarkColor,
                              onPressed: () {
                                Get.back();
                                // Get.to(()=>MyCouponsPage());

                              },
                            ),
                          );
                        },child: FinancePageItemWidget(title: 'local_transfer'.tr, imageIcon: 'assets/images/icons/finance_icons/4.png')),
                        InkWell(onTap: (){
                          // Get.to(()=>ChooseBeneficiaryPage());
                          Get.defaultDialog(
                            title: "".tr,
                            middleText: "verify_your_id".tr,
                            middleTextStyle:  TextStyle(
                                color: Colors.red,
                                fontSize: 18
                            ),
                            titleStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 18
                            ),
                            confirm:   FlatButton(
                              child:  Text("press_to_verify_id".tr,style: TextStyle(
                                  color: Colors.white
                              ),),
                              color: AppColors.mainGoldenDarkColor,
                              onPressed: () {
                                Get.back();
                                // Get.to(()=>MyCouponsPage());

                              },
                            ),
                          );
                        },child: FinancePageItemWidget(title: 'international_transfer'.tr, imageIcon: 'assets/images/icons/finance_icons/3.png')),

                      ],)
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
