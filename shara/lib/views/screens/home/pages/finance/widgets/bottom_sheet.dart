import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';

import 'package:shara/views/widgets/custom_text_form_field.dart';
import 'package:shara/views/widgets/svg_widget.dart';
import 'package:shara/views/widgets/web_page.dart';

import '../../../../../../controllers/buy_points_controller.dart';
import '../../../../../../helpers/app_colors.dart';
import 'package:overlay_support/overlay_support.dart';

class BottomSheetWidget extends StatelessWidget {

   BottomSheetWidget({Key key}) : super(key: key);

  final BuyPointsController controller = Get.find();
  final pointCtrl = TextEditingController();


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
          child: SingleChildScrollView(
            child: Obx(()=>Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'insert_points_to_buy'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                    hintText: 'number_of_points'.tr,
                    keyboardType: TextInputType.number,
                    controller: pointCtrl,
                    errorMessage: controller.errorMessage.value,
                    isValideField: controller.errorMessage.value.isEmpty,
                    // labelText: 'insert_number_points'.tr,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
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
                InkWell(
                  onTap: (){
                   if(pointCtrl.text.isEmpty){
                     controller.errorMessage.value = 'please_points_to_buy'.tr;
                   }else{
                     FocusScope.of(context).unfocus();
                     Get.back();
                     controller.errorMessage.value = '';
                     controller.generatePaymentUrl(pointCtrl.text,(paymentUrl){
                       println(paymentUrl);
                       Get.to(()=>WebPage(paymentUrl));

                     });
                   }
                    // println('صثصقفثص');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/madacard.png',),width: 69,height: 65,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/visa_PNG4.png',),width: 59,height: 55,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/mc.png',),width: 45,height: 40,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/am_exp.png',),width: 40,height: 30,),
                      ),
                    ],
                  ),
                ),
                Container(width: double.infinity,height: 1,color: Colors.white,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/apple_pay.png',color: Colors.black54,),width: 69,height: 65,),
                    ),

                    // Text('credit_card'.tr,style: TextStyle(
                    //     color: AppColors.navBarUnselectedIconsColor,
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold
                    // ),)
                  ],
                ),
                Container(width: double.infinity,height: 1,color: Colors.white,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(child: SvgImageWidget('assets/images/icons/payment_icons/Stc-logo.png',),width: 69,height: 65,),
                    ),


                  ],
                ),
                Container(width: double.infinity,height: 1,color: Colors.white,),

                SizedBox(height: 36,),
              ],
            )),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Color(0xffF8F9F7),
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     child: GestureDetector(
        //       onTap:(){
        //         Get.back();
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Icon(Icons.clear_outlined),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
