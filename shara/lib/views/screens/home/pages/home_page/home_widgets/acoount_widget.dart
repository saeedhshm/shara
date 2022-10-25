import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/screens/account/account_information.dart';
import 'package:get/get.dart';

import '../../profile.dart';
// import 'dart:math' as math;

class AccountHomeWidget extends StatelessWidget {

  final InitAppController initAppController = Get.find();

   AccountHomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>ProfilePage());
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.white.withOpacity(0.2)
              //       ),
              //       width: double.infinity,
              //       height: 60,
              //     ),
              //   ),
              // ) ,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: SizedBox(
                    //     height: 70,
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(100),
                    //       child: Image.asset(
                    //         'assets/images/icons/home/user.png',color: Colors.white,),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${initAppController.userData.value.user.firstName} ${initAppController.userData.value.user.lastName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.mainDarkGreyColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          initAppController.userData.value.user.membership.mempName(initAppController.isArabicLang),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: initAppController.userData.value.user.membership.typeColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'your_points'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.mainDarkGreyColor),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '${initAppController.userData.value.user.points}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.mainDarkGreyColor),
                        ),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(initAppController.userData.value.user.membership.typeBGImage),
            fit: BoxFit.fill
          ),
            // gradient: LinearGradient(
            //     colors: initAppController.userData.value.user.membership.typeColors,
            //     // stops: [0.1,0.0,1.0],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     // stops: [0.25, 0.25,0.25],
            //     // tileMode: TileMode.clamp
            // ),
            // color: initAppController.userData.value.user.membership.type.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
