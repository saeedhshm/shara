import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/buy_points_controller.dart';
import '../../../../../../helpers/app_colors.dart';
import '../../../../../widgets/flat_botton.dart';
import '../../../../../widgets/svg_widget.dart';
import '../../finance/contacts.dart';
import '../../finance/widgets/bottom_sheet.dart';

class FinanceWidget extends StatelessWidget {

    FinanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _ItemWidget(title: 'add_balance'.tr, imageIcon: 'assets/images/icons/finance_icons/2.png',onTap: (){
              Get.put(BuyPointsController());
              Get.bottomSheet(
                  BottomSheetWidget()
              );
            },),
            Container(width: 0.5,height: 60,color: Colors.grey.withValues(alpha: 0.5),),
            _ItemWidget(title: 'transfer_points'.tr, imageIcon: 'assets/images/icons/finance_icons/8.svg',onTap: (){
              Get.to(()=>ContactsPage());
            },),
            Container(width: 0.5,height: 60,color: Colors.grey.withValues(alpha: 0.5),),
            _ItemWidget(imageIcon: 'assets/images/icons/finance_icons/4.png',title: 'local_transfer'.tr,onTap: (){
              Get.defaultDialog(
                title: "".tr,
                middleText: "verify_your_id".tr,
                middleTextStyle:  TextStyle(
                    color: Colors.red,
                    fontSize: 18
                ),
                titleStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 18
                ),
                confirm:   FlatButtonWidget(
                  child:  Text("press_to_verify_id".tr,style: TextStyle(
                      color: Colors.white
                  ),),
                  color: AppColors.mainGoldenDarkColor,
                  onPressed: () {
                    Get.back();
                    // Get.to(()=>MyCouponsPage());

                  },
                ),
              );
            },),
            Container(width: 0.5,height: 60,color: Colors.grey.withValues(alpha: 0.5),),

        _ItemWidget(title: 'international_transfer'.tr, imageIcon: 'assets/images/icons/finance_icons/3.png',onTap: (){
          Get.defaultDialog(
            title: "".tr,
            middleText: "verify_your_id".tr,
            middleTextStyle:  TextStyle(
                color: Colors.red,
                fontSize: 18
            ),
            titleStyle: TextStyle(
                color: Colors.red,
                fontSize: 18
            ),
            confirm:   FlatButtonWidget(
              child:  Text("press_to_verify_id".tr,style: TextStyle(
                  color: Colors.white
              ),),
              color: AppColors.mainGoldenDarkColor,
              onPressed: () {
                Get.back();
                // Get.to(()=>MyCouponsPage());

              },
            ),
          );
        },)
          ],
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {

  final String imageIcon;
  final String title;
  final void Function()? onTap;
   _ItemWidget({Key? key,required this.imageIcon,required this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            SizedBox(child: SvgImageWidget(imageIcon,),height: 55,),
            Text(title,style: TextStyle(
                color: AppColors.navBarUnselectedIconsColor,
                fontSize: 12
            ),)
          ],
        ),
      ),
    ));
  }
}
