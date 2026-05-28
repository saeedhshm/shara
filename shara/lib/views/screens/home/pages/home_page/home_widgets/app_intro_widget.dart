import 'package:flutter/material.dart';
import 'package:shara/controllers/home_controller.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';

class AppIntroWidget extends StatelessWidget {

    AppIntroWidget({Key? key}) : super(key: key);
   final InitAppController initAppController = Get.find();
   final homeController  = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome_to_shara'.tr,
          style: TextStyle(
              color: AppColors.mainDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          homeController.homeData.value.intro(initAppController.isArabicLang),

          style: TextStyle(
              color: AppColors.mainLightGreyColor,
              height: 1.75
          ),
          maxLines: 3,
        ),
      ],

    );
  }
}
