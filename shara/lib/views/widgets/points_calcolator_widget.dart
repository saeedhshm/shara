// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shara/controllers/init_app_controller.dart';
// import 'package:shara/models/clac_points.dart';
//
// import 'custom_text_form_field.dart';
// import 'drop_down_widget.dart';
//
// class PointsCalculatorWidget extends StatelessWidget {
//
//   final Function onChange;
//   final TextEditingController selectMembershipSpendCtrl;
//   final List<CalcPoints> points;
//   final dynamic items;
//
//    PointsCalculatorWidget({this.onChange,this.selectMembershipSpendCtrl,this.items,this.points});
//
//   @override
//   Widget build(BuildContext context) {
//     InitAppController initApp = Get.find();
//     return Container(
//       child: Column(
//         children: [
//           DropdownButtonHideUnderline(
//             child: DropdownButton2(
//               customButton:  DropDownWidget(
//                 controller: selectMembershipSpendCtrl,
//               ),
//               items: points
//                   .map((item) =>
//                   DropdownMenuItem<CalcPoints>(
//                     value: item,
//                     child: Text(
//                       item.name(initApp.isArabicLang),
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ))
//                   .toList(),
//               value: calculateController.selectedPoint,
//               onChanged: (value) {
//                 calculateController.selectedPoint = value;
//                 selectMembershipSpendCtrl.text =  calculateController.selectedPoint.name(initApp.isArabicLang);
//                 calculateController.calculateSpendingPoints(double.tryParse(pointsSpendCtrl.text) ?? 0);
//
//               },
//               buttonHeight: 40,
//               buttonWidth: 140,
//               itemHeight: 40,
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           CustomTextFormField(
//             keyboardType: TextInputType.number,
//             onChange: (value){
//               calculateController.calculateSpendingPoints(double.tryParse(value) ?? 0);
//             },
//             controller: pointsSpendCtrl,
//             hintText: 'enter_sum_in_sr'.tr,
//             labelText: 'sum_in_sr'.tr,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text(
//             '${calculateController.totalSpendingPoints.value}' + ' ' + 'pont'.tr,
//             style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 18,
//                 color: AppColors.fontLightGreyColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
