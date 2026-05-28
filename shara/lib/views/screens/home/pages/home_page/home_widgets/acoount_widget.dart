import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';

import '../../profile.dart';
// import 'dart:math' as math;

class AccountHomeWidget extends StatelessWidget {

  final InitAppController initAppController = Get.find();

    AccountHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = initAppController.userData.value.user;
    if (user == null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return InkWell(
      onTap: (){
        Get.to(()=>ProfilePage(onBack: Get.back));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.mainDarkGreyColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          user.membership?.mempName(initAppController.isArabicLang) ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: user.membership?.typeColor ?? Colors.grey),
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
                          '${user.points}',
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
          // image: DecorationImage(
          //   image: AssetImage(user.membership?.typeBGImage ?? ''),
          //   fit: BoxFit.fill
          // ),
          borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
