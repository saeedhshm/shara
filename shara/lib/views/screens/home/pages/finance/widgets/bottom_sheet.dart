import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/views/widgets/svg_widget.dart';

import '../../../../../../helpers/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 22),
          width:double.infinity,
          decoration: BoxDecoration(
              color: AppColors.lightGoldenColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),

              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'choose_money_add_method'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(child: SvgImageWidget('assets/images/icons/finance_icons/add_balance/3.svg',),width: 50,height: 55,),
                  ),

                  Text('apple pay',style: TextStyle(
                      color: AppColors.navBarUnselectedIconsColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Container(width: double.infinity,height: 1,color: Colors.white,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(child: SvgImageWidget('assets/images/icons/finance_icons/add_balance/2.svg',),width: 50,height: 55,),
                  ),

                  Text('credit_card'.tr,style: TextStyle(
                      color: AppColors.navBarUnselectedIconsColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Container(width: double.infinity,height: 1,color: Colors.white,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(child: SvgImageWidget('assets/images/icons/finance_icons/add_balance/1.svg',),width: 50,height: 55,),
                  ),

                  Text(
                    '${'bank_transfer_to'.tr} stc pay',style: TextStyle(
                      color: AppColors.navBarUnselectedIconsColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Container(width: double.infinity,height: 1,color: Colors.white,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(child: SvgImageWidget('assets/images/icons/finance_icons/add_balance/4.svg',),width: 50,height: 55,),
                  ),

                  Text('inesta_add'.tr,style: TextStyle(
                      color: AppColors.navBarUnselectedIconsColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Container(width: double.infinity,height: 1,color: Colors.white,),
              SizedBox(height: 16,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF8F9F7),
              borderRadius: BorderRadius.circular(100),
            ),
            child: GestureDetector(
              onTap:(){
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.clear_outlined),
              ),
            ),
          ),
        )
      ],
    );
  }
}
