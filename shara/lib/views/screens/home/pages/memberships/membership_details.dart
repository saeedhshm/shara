import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/membership_details.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:get/get.dart';

class MembershipDetailsScreen extends StatelessWidget {

  MembershipDetailsScreen({Key? key}) : super(key: key){
    controller.getMembershipDetails();
  }

  final MembershipDetailsController controller = Get.find();
  InitAppController initApp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            controller.membershipDetails.value.name(initApp.isArabicLang),
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
          )),
      backgroundColor: Colors.white,
      body: Obx(()=>LoadingDataWidget(
        isLoading: controller.isLoading.value,
        child:!controller.isLoading.value ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.red,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.membershipDetails.value.details(initApp.isArabicLang),style: TextStyle(
                         color: AppColors.favBackground,
                    fontSize: 17,
                      height: 1.5,
                      fontWeight: FontWeight.w500
                  ),),

                  for(int i = 0; i< controller.membershipDetails.value.features!.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25,),
                        Image.asset('assets/images/icons/membership_icons/${i%3}.png',height: 35,),
                        SizedBox(height: 10,),
                        Text('membership_feature'.tr,style: TextStyle(
                            color: AppColors.favBackground,
                            fontSize: 17,
                            height: 1.5,
                            fontWeight: FontWeight.w700
                        ),) ,
                        SizedBox(height: 10,),
                        Text(controller.membershipDetails.value.features![i].name(initApp.isArabicLang),style: TextStyle(
                            color: AppColors.fontLightGreyColor,
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ) : SizedBox(),
      )),
    );
  }
}
