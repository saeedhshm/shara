import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/membership_controller.dart';
import 'package:shara/controllers/membership_details.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/views/screens/home/pages/memberships/membership_details.dart';

class MembershipPage extends StatelessWidget {

  MembershipController controller = Get.put(MembershipController());
  MembershipPage({Key key}) : super(key: key);
  InitAppController initApp = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainLightColor,
        elevation: 0,
        title: Text(
          'shara_membership'.tr,
          style: TextStyle(
              color: AppColors.mainDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          maxLines: 3,
        ),
        leadingWidth: 0,
      ),
      body: Obx(()=>LoadingDataWidget(
        isLoading: controller.loading.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                controller.memebershipService.value.memberShipIntro(initApp.isArabicLang),
                style: TextStyle(wordSpacing: 1.3, height: 1.35),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                height: size.height / 2.25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {

                    return Container(
                      width: size.width / 1.5,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      // color:Colors.blue,
                                      child: Text(
                                        controller.memebershipService.value.memberships.data[index].name(initApp.isArabicLang),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                // color: Colors.red,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.network(
                                        controller.memebershipService.value.memberships.data[index].image(initApp.isArabicLang)),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        Get.put(MembershipDetailsController()).membershipDetails.value =  controller.memebershipService.value.memberships.data[index];
                                        Get.to(MembershipDetailsScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'read_more'.tr,
                                          style: TextStyle(
                                              color: AppColors.mainLightGreyColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.membershipColors[index],
                          borderRadius: BorderRadius.circular(15)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 32,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),)
    );
  }
}
