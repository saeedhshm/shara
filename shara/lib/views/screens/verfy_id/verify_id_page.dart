import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/views/screens/verfy_id/verify_id_controller.dart';

import '../../../helpers/app_colors.dart';
import '../../widgets/leading_back_arrow.dart';

class VerifyIdPage extends StatelessWidget {


   VerifyIdPage({Key? key}) : super(key: key){
     controller.isVerifiedId.value = true;
   }

   final VerifyIDController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'confirm_verification'.tr,
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
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: Image.asset('assets/images/icons/profile/verify_id/2.png'),width: 170,),
            SizedBox(height: 10,),
            Text('id_verification_done'.tr,style: TextStyle(
              color: AppColors.mainDarkGreyColor,
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
