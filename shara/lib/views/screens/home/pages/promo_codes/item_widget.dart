import 'package:flutter/material.dart';
import 'package:shara/controllers/promo_codes_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/screens/home/pages/promo_codes/promo_code_varients_screen.dart';

import '../../../../../models/promo_code.dart';
import '../../../../widgets/image_from_server.dart';

class ItemWidget extends StatelessWidget {

  final int index;

  PromoCodeController controller = Get.find();

  ItemWidget( {Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8
                  ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                    child: Text(
                      controller.promoCodeService.value.promoCodes[index].title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "${"start_price".tr} ${controller.promoCodeService.value.promoCodes[index].beginPrice}",
                  //   style: TextStyle(
                  //       color: AppColors.fontLightGreyColor,
                  //       fontSize: 14),
                  // )
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
                        child: imageFromServer(
                          imageUrl:controller.promoCodeService.value.promoCodes[index].photo,
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

              controller.promoCode = controller.promoCodeService.value.promoCodes[index];
              Get.to(() => PromoCodeVariantsScreen());
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  "more".tr,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.mainGoldenDarkColor),
            ),
          )
        ],
      ),
    );
  }
}
