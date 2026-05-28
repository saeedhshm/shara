import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
import 'package:shara/controllers/discount_coupon_controller.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../../models/discount_coupon.dart';
import '../../../../widgets/network_image.dart';

class DiscountCoupons extends StatelessWidget {
  final void Function()? onBack;

  DiscountCoupons({Key? key,required this.onBack}) : super(key: key);

  final controller = Get.put(DiscountCouponsController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.mainLightColor,
              elevation: 0,
              title: Text(
                'disc_coupon'.tr,
                style: TextStyle(
                    color: AppColors.mainDarkGreyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                maxLines: 3,
              ),
              leading: Container(
                child: InkWell(
                  onTap: onBack,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
          body: Obx(()=>Padding(
            padding: const EdgeInsets.all(16.0),
            child: controller.loading.value ? Center(child: LoadingIndicatorWidget() ,) :
            Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      controller.getAllCoupons();
                    }, child: ListView.separated(
                    itemCount: controller.couponsManager.value.data.length,
                    controller: controller.scrollController,
                    itemBuilder: (context,index){
                      var coupon = controller.couponsManager.value.data[index];
                      return DiscountCopounItemWidget(coupon: coupon);
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(height: 8 ,);
                    },
                  ),
                  ),
                ),
                controller.subLoading.value ? Container(

                  margin: EdgeInsets.all(8),
                  child: controller.nomoreData.value != '' ? Center(
                    child: Text(controller.nomoreData.value,style: TextStyle(
                        color: AppColors.mainGoldenDarkColor,
                        fontSize: 16
                    ),),
                  ) : Center(child: LoadingIndicatorWidget()) ,
                ): SizedBox()
              ],
            ),
          )),

        ),
        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   color: Colors.black54.withValues(alpha: 0.3),
        //   child: Center(
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: Colors.red
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}

class DiscountCopounItemWidget extends StatelessWidget {

  final Coupon coupon;
  final controller = Get.put(DiscountCouponsController());
  DiscountCopounItemWidget({Key? key,required this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.dialog(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(onTap: (){
                                Get.back();
                              },child: Icon(Icons.clear)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              width: double.infinity,
                              height: 150,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),child: loadImage(coupon.imageUrl))),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 32),
                            child: Text(coupon.code,style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          ),

                        ),
                        Obx(()=>Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () async {
                              // Get.back();c
                              controller.copyingCoupon.value = true;
                              await Clipboard.setData(ClipboardData(text: coupon.code));
                              Future.delayed(Duration(milliseconds: 1000),(){
                                controller.copyingCoupon.value = false;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.mainGoldenDarkColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: controller.copyingCoupon.value ? Icon(Icons.copy_rounded,color: Colors.white,) : Text(
                                    'copy_coupon'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ));
      },
      child: Container(
        // color: Colors.grey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        height: Get.width / 2.2,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: loadImage(coupon.imageUrl,fit: BoxFit.fill)),
      ),
    );
  }
}
