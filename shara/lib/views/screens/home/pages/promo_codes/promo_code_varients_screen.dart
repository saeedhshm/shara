import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/promo_codes_controller.dart';
import 'package:shara/views/screens/home/pages/promo_codes/variant_item_widget.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../../helpers/utils/widgets/loading_indicator.dart';

class PromoCodeVariantsScreen extends StatelessWidget {

  PromoCodeController controller = Get.find();
   PromoCodeVariantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
      children: [
        Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.mainLightColor,
              elevation: 0,
              title: Text(
                controller.promoCode!.title ?? '',
                style: TextStyle(
                    color: AppColors.mainDarkGreyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                maxLines: 3,
              ),
              leading: Container(
                child: InkWell(
                  onTap: Get.back,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:Column(
              children: [
                Expanded(child: GridView.builder(
                  // controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65),
                  itemCount: controller.promoCode!.variants!.length,
                  itemBuilder: (contx, indx) {
                    return VariantItemWidget(index:indx);
                  },
                )),

              ],
            ),
          ),
        ),
        controller.buyingCode.value? Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withValues(alpha: 0.3),
          child: Center(
            child: LoadingIndicatorWidget(),
          ),
        ) : SizedBox()
      ],
    ));
  }
}
