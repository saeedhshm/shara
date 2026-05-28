import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';

import '../../../../models/my_coupons_manager.dart';
import '../../../widgets/network_image.dart';


class MyCouponWidget extends StatelessWidget {

  final MyGiftCard card;

  MyCouponWidget({Key? key,required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: AppColors.mainLightColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.mainLightColor, width: 1)),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            // color: ((index) % 4 == 0) || ((index - 1) % 4 == 0)
                            //     ? AppColors.mainLightColor
                            //     : Colors.white
                            color: AppColors.mainLightColor
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                              child: Text(
                                "${"price".tr} ${card.price}",
                                style: TextStyle(
                                    color: AppColors.mainDarkGreyColor,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex:1,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: AppColors.mainLightColor),
                                )),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: SizedBox(
                                  // width: (width / 2.5),
                                  child: loadImage(card.photo,
                                    fit: BoxFit.cover,

                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
