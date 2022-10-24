import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/calculate_points.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/models/clac_points.dart';
import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/drop_down_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class CalculatePointsPage extends StatefulWidget {

  CalculatePointsPage({Key key}) : super(key: key) {

  }


  @override
  State<CalculatePointsPage> createState() => _CalculatePointsPageState();
}

class _CalculatePointsPageState extends State<CalculatePointsPage> {

  final selectMembershipEarnCtrl = TextEditingController();
  final selectMembershipSpendCtrl = TextEditingController();

  final pointsEarnCtrl = TextEditingController();
  final pointsSpendCtrl = TextEditingController();


  InitAppController initApp = Get.find();
  // final selectBrandCtrl = TextEditingController();



  // final spendingSumCtrl = TextEditingController();

  final calculateController = Get.put(CalculatePointsController());

  @override
  initState(){
    super.initState();
    selectMembershipEarnCtrl.text = 'select_membership_type'.tr;
    selectMembershipSpendCtrl.text = 'select_membership_type'.tr;
    // selectBrandCtrl.text = 'select_brand'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainLightColor,
            elevation: 0,
            title: Text(
              'points_calculator'.tr,
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
        body: Obx(()=>LoadingDataWidget(
          isLoading: calculateController.loading.value,
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   child: Stack(
              //     children: [
              //       Container(
              //         width: double.infinity,
              //         height: 100,
              //         // color: Colors.red,
              //         color: AppColors.mainLightColor,
              //         child: Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   Text(
              //                     'points_calc'.tr,
              //                     style: TextStyle(
              //                         color: AppColors.mainDarkGreyColor,
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w600,
              //                         height: 1.5),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         bottom: 0,
              //         left: 0,
              //         right: 0,
              //         child: Container(
              //             color: Colors.white,
              //             child: Image.asset(
              //               'assets/images/icons/login/title-bg.png',
              //               width: double.infinity,
              //             )),
              //       ),
              //
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 16,right: 16),
                child: Text(
                  'calculate_page_header_text'.tr,
                  style: TextStyle(
                      color: AppColors.mainDarkGreyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            calculateController.earningPoints.value = true;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                                child: Text(
                                  'earn_shara_points'.tr,
                                  style: TextStyle(
                                      color: calculateController.earningPoints.value
                                          ? AppColors.mainGoldenDarkColor
                                          : Colors.white,
                                      fontWeight: FontWeight.w600),
                                )),
                            decoration: BoxDecoration(
                                color: calculateController.earningPoints.value
                                    ? AppColors.mainLightColor
                                    : AppColors.mainGoldenDarkColor,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            calculateController.earningPoints.value = false;
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: !calculateController.earningPoints.value
                                      ? AppColors.mainLightColor
                                      : AppColors.mainGoldenDarkColor,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                  child: Text(
                                    'spend_shara_points'.tr,
                                    style: TextStyle(
                                        color: calculateController.earningPoints.value
                                            ? Colors.white
                                            : AppColors.mainGoldenDarkColor,
                                        fontWeight: FontWeight.w600),
                                  ))),
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                    color: AppColors.mainGoldenDarkColor,
                    borderRadius: BorderRadius.circular(20)),
              )),
              SizedBox(
                height: 16,
              ),
              Obx(() => Expanded(
                  child: ListView(
                    children: [
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) => ScaleTransition(
                          child: child,
                          scale: animation,
                        ),
                        child: calculateController.earningPoints.value
                            ? Container(
                          // key: UniqueKey(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Text(
                              //   'how_much_to_save'.tr,
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w700,
                              //       fontSize: 18,
                              //       color: AppColors.fontLightGreyColor),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton:  DropDownWidget(
                                    controller: selectMembershipEarnCtrl,
                                  ),
                                  items: calculateController.points
                                      .map((item) =>
                                      DropdownMenuItem<CalcPoints>(
                                        value: item,
                                        child: Text(
                                          item.name(initApp.isArabicLang),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  value: calculateController.selectedPoint,
                                  onChanged: (value) {
                                    calculateController.selectedPoint = value;
                                    selectMembershipEarnCtrl.text =  calculateController.selectedPoint.name(initApp.isArabicLang);
                                    calculateController.calculateEarningPoints(double.tryParse(pointsEarnCtrl.text) ?? 0);
                                  },
                                  buttonHeight: 40,
                                  buttonWidth: 140,
                                  itemHeight: 40,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                controller: pointsEarnCtrl,
                                keyboardType: TextInputType.number,
                                hintText: 'enter_sum_in_sr'.tr,
                                labelText: 'sum_in_sr'.tr,
                                onChange: (value){
                                  calculateController.calculateEarningPoints(double.tryParse(value) ?? 0);
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${calculateController.totalEarningPoints.value}' + ' ' + 'pont'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: AppColors.fontLightGreyColor),
                              ),
                            ],
                          ),
                        )
                            : Container(
                          // key: UniqueKey(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Text(
                              //   'number_of_points_will_earn'.tr,
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w700,
                              //       fontSize: 18,
                              //       color: AppColors.fontLightGreyColor),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // DropDownWidget(
                              //   controller: selectBrandCtrl,
                              // ),
                              // SizedBox(
                              //   height: 15,
                              // ),

                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton:  DropDownWidget(
                                    controller: selectMembershipSpendCtrl,
                                  ),
                                  items: calculateController.points
                                      .map((item) =>
                                      DropdownMenuItem<CalcPoints>(
                                        value: item,
                                        child: Text(
                                          item.name(initApp.isArabicLang),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  value: calculateController.selectedPoint,
                                  onChanged: (value) {
                                    calculateController.selectedPoint = value;
                                    selectMembershipSpendCtrl.text =  calculateController.selectedPoint.name(initApp.isArabicLang);
                                    calculateController.calculateSpendingPoints(double.tryParse(pointsSpendCtrl.text) ?? 0);

                                  },
                                  buttonHeight: 40,
                                  buttonWidth: 140,
                                  itemHeight: 40,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                keyboardType: TextInputType.number,
                                onChange: (value){
                                  calculateController.calculateSpendingPoints(double.tryParse(value) ?? 0);
                                },
                                controller: pointsSpendCtrl,
                                hintText: 'enter_sum_in_sr'.tr,
                                labelText: 'sum_in_sr'.tr,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${calculateController.totalSpendingPoints.value}' + ' ' + 'pont'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: AppColors.fontLightGreyColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )))
            ],
          ),
        )),
      ),
    );
  }
}

