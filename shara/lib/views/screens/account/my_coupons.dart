import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/views/screens/account/widgets/my_coupon_widget.dart';

import '../../../controllers/my_coupons_controller.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/utils/widgets/loading_indicator.dart';
import '../../widgets/decorated_app_bar.dart';
import '../../widgets/leading_back_arrow.dart';



class MyCouponsPage extends StatelessWidget {

  MyCouponsPage({Key? key}) : super(key: key){
    controller.retrieveMyCoupons();
  }

  MyCouponsController controller = Get.put(MyCouponsController());




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: DecoratedAppBar(
        child: Row(
          children: [
            LeadingBackArrow(
              size: 30,
              onBack: Get.back,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'account_info'.tr,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      body: Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child:controller.loading.value ? Center(
          child: LoadingIndicatorWidget(),
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'my_coupons'.tr,
              style: TextStyle(
                  color: AppColors.mainDarkGreyColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 20,
            ),
            Expanded(child:controller.myCoupons.value.giftCards!.length > 0 ? GridView.builder(
              // controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,),
              itemCount: controller.myCoupons.value.giftCards!.length,
              itemBuilder: (contx, indx) {
                return MyCouponWidget(card: controller.myCoupons.value.giftCards![indx],);
              },
            ):Center(child: Text('no_coupons_yet'.tr,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.mainGoldenDarkColor
            ),))),

          ],
        ),
      )),
    );
  }
}