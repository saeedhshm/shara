import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';

class AccountInfoPage extends StatelessWidget {

  final InitAppController initAppController = Get.find();

  AccountInfoPage({Key key}) : super(key: key);
  // final accountInfoController = Get.put(AccountInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          leading: Container(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: LeadingBackArrow(
                size: 30,
              ),
            ),
          )),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'personal_info_spc'.tr,
                  style: TextStyle(
                    color: AppColors.mainDarkGreyColor,
                    fontSize: 23,
                    letterSpacing: 0.0,
                    // wordSpacing: 18
                  ),

                  // textAlign: TextAlign.justify,
                ),
                _rowItem('user_full_name'.tr, '${initAppController.userData.value.user.firstName} ${initAppController.userData.value.user.lastName}'),
                _rowItem('phone'.tr, '0${int.tryParse(initAppController.userData.value.user.phone)}'),

                _rowItem('member_type'.tr, initAppController.userData.value.user.membership.mempName(initAppController.isArabicLang)),
                _rowItem('member_id'.tr,   '${initAppController.userData.value.user.membership.id}'),
                _rowItem('subscribe_date'.tr, initAppController.userData.value.user.createdAt),
                _rowItem('points_count'.tr, '${initAppController.userData.value.user.points}'),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _rowItem(String title,String data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16,),
        Text(title,style: TextStyle(
            color: AppColors.fontLightGreyColor ,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 12,),
        Text(data,style: TextStyle(
            color: AppColors.mainDarkGreyColor  ,
            fontSize: 18
        ),),
        SizedBox(height: 12,),
        Container(width: double.infinity,height: 1,color: AppColors.borderTextFieldColor,)

      ],
    ) ;
  }
}
