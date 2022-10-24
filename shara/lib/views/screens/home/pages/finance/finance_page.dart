import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/screens/home/pages/finance/local_tranfer.dart';
import 'package:shara/views/screens/home/pages/finance/transfer_to_contact.dart';
import 'package:shara/views/screens/home/pages/finance/widgets/bottom_sheet.dart';
import 'package:shara/views/screens/home/pages/finance/widgets/finance_page_item.dart';

import 'choose_beneficiary.dart';
import 'contacts.dart';

class FinancePage extends StatelessWidget {


   FinancePage({Key key}) : super(key: key);

   InitAppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.mainLightColor,
          child: Column(
            children: [
              // 01226973508
              // 0963321300
              Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: Row(
                        children: [
                          Container(

                            width:150 ,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Image.asset('assets/images/icons/logo.png',width: 150,)
                            ),
                          )
                          ,
                          Spacer(),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),

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
                          color: AppColors.peageColor,
                          border: Border.all(color: AppColors.goldColor,width: 1),
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      SizedBox(height: 16,),
                      Wrap(children: [
                        InkWell(
                          onTap: (){
                            Get.bottomSheet(
                              BottomSheetWidget()
                            );
                          },
                            child: FinancePageItemWidget(title: 'add_balance'.tr, imageIcon: 'assets/images/icons/finance_icons/2.png')),
                        GestureDetector(onTap: (){
                          Get.to(()=>ContactsPage());
                        },child: FinancePageItemWidget(title: 'transfer_points'.tr, imageIcon: 'assets/images/icons/finance_icons/8.svg',)),
                        InkWell(onTap: (){
                          Get.to(()=>ChooseBeneficiaryPage());
                        },child: FinancePageItemWidget(title: 'local_transfer'.tr, imageIcon: 'assets/images/icons/finance_icons/4.png')),
                        FinancePageItemWidget(title: 'international_transfer'.tr, imageIcon: 'assets/images/icons/finance_icons/3.png'),

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
