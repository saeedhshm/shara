import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';

class ChangeLanguagePage extends StatelessWidget {

   ChangeLanguagePage({Key key}) : super(key: key);
   InitAppController initApp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'change_lang'.tr,
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          leading: Container(
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          )) ,
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                initApp.updateAppLanguage('ar');
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                  child:Row(
                    children: [

                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'العربية',
                        style: TextStyle(
                            color: AppColors.mainDarkGreyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Get.locale.languageCode == 'ar' ? Image.asset(
                        'assets/images/icons/lang/check.png',
                        width: 35,
                      ) : SizedBox(),
                    ],
                  )
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.mainLightColor,
            ),
            InkWell(
              onTap: (){
                initApp.updateAppLanguage('en');
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                  child:Row(
                    children: [

                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'English',
                        style: TextStyle(
                            color: AppColors.mainDarkGreyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Get.locale.languageCode != 'ar' ? Image.asset(
                        'assets/images/icons/lang/check.png',
                        width: 35,
                      ) : SizedBox(),
                    ],
                  ) ,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.mainLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
