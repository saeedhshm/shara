import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';

import '../../../../../controllers/promo_codes_controller.dart';
import '../../../../../models/promo_code.dart';
import '../../../../widgets/flat_botton.dart';
import '../../../../widgets/image_from_server.dart';
import '../../../../widgets/network_image.dart';
import '../../../account/my_coupons.dart';

class VariantItemWidget extends StatelessWidget {
  PromoCodeController controller = Get.find();
  final int index;
  VariantItemWidget({Key key, @required this.index}) : super(key: key);

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
                      Expanded(
                          flex:1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Text(
                                    "${'value'.tr}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Text(
                                    "${controller.promoCode.variants[index].value}",
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "replacement_fee".tr,
                                  style: TextStyle(
                                      color: AppColors.mainGoldenDarkColor,
                                      fontSize: 14),
                                ),
                                Text(
                                  "${controller.promoCode.variants[index].price} ${'Point'.tr}",
                                  style: TextStyle(
                                      color: AppColors.mainGoldenDarkColor,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          )),
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
                                  child: loadImage(controller.promoCode.photo,
                                    fit: BoxFit.cover,

                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )),

            InkWell(
              onTap: (){



                if(controller.promoCode.variants[index].stock.quantity > 0){

                  controller.buyPromoCodePay(controller.promoCode.variants[index].id,(message){
                    Get.defaultDialog(
                      title: "".tr,
                      middleText: "buying_success".tr,
                      middleTextStyle:  TextStyle(
                          color: Colors.green,
                          fontSize: 18
                      ),
                      titleStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 18
                      ),
                      confirm:   FlatButtonWidget(
                        child:  Text("show_coupon".tr,style: TextStyle(
                            color: Colors.white
                        ),),
                        color: AppColors.mainGoldenDarkColor,
                        onPressed: () {
                          Get.back();
                          Get.to(()=>MyCouponsPage());

                        },
                      ),
                    );
                  });
                }else{
                  println("this item not available");
                }
              },
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                        controller.promoCode.variants[index].stock.quantity > 0 ? "buy".tr : "not_available".tr,
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color:controller.promoCode.variants[index].stock.quantity > 0 ? AppColors.mainGoldenDarkColor : Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
