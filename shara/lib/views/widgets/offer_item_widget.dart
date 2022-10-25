import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/models/offer.dart';
import 'package:shara/views/widgets/favorit_icon_widget.dart';
import 'package:shara/views/widgets/network_image.dart';

class OfferItemWidget extends StatelessWidget {

  final Offer offer;
   OfferItemWidget(this.offer);
  InitAppController initAppController = Get.find();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isArabic = initAppController.isArabicLang;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                // color: Colors.red,
                child: loadImage(offer.image(isArabic),fit: BoxFit.cover),
                width: (size.width / 1.5),
                height: 200,
              ),
              // Positioned(
              //   left: 0,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         vertical: 20.0, horizontal: 16),
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: AppColors.mainDarkGreyColor,
              //           borderRadius:
              //           BorderRadius.circular(50)),
              //       // width: 30,
              //       // height: 30,
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Center(
              //           child: FavoriteIconWidget(size: 20,),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            offer.partner.name(isArabic),
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: (size.width / 1.5),
            child: Text(
              offer.title(isArabic),
              style: TextStyle(
                  color: AppColors.mainLightGreyColor,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
