import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'dart:math' as math;

class OffersTitleShowAllWidget extends StatelessWidget {

  final Function ()onShowAllPressed;
  final String title;
  final double padding;

   OffersTitleShowAllWidget({Key? key, required this.onShowAllPressed,required this.title,this.padding = 20}) : super(key: key);
   InitAppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    println('-------------------- arrow image');
    println('assets/images/icons/home/sec_arrow_${appController.isArabicLang ? 'ar' : 'en'}.png');
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: this.padding),
        child: Row(
          children: [
            Hero(
              tag: title,
              child: GestureDetector(
                onTap: (){},
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColors.mainDarkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  maxLines: 3,
                ),
              ),
            ),
            Spacer(),
           InkWell(
              onTap: onShowAllPressed,
              child: Row(
                children: [
                  Text(
                    'show_all'.tr,
                    style: TextStyle(color: AppColors.mainLightGreyColor),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(appController.isArabicLang ? 0 :math.pi),
                    child: Image.asset(
                      'assets/images/icons/home/sec_arrow_ar.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
