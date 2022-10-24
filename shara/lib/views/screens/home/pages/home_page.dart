import 'package:flutter/material.dart';
import 'package:shara/controllers/home_controller.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/views/screens/home/pages/settings/home_widgets/acoount_widget.dart';
import 'package:shara/views/screens/home/pages/settings/home_widgets/app_intro_widget.dart';
import 'package:shara/views/screens/home/pages/settings/home_widgets/calculate_points_widget.dart';
import 'package:shara/views/screens/home/pages/settings/home_widgets/home_appbar.dart';
import 'package:shara/views/screens/home/pages/settings/home_widgets/slider_banner_widget.dart';
import 'package:shara/views/widgets/list_offers_items.dart';
import 'package:shara/views/widgets/offers_title_show_all.dart';

import '../../../../controllers/promo_codes_controller.dart';
import 'promo_codes/item_widget.dart';


class HomePage extends StatelessWidget {

  final Function onShowOffers;

  HomePage({Key key,this.onShowOffers}) : super(key: key);

  final InitAppController initAppController = Get.find();
  final homeController  = Get.find<HomeController>();
  PromoCodeController controller =  Get.find();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Obx(()=>LoadingDataWidget(
        isLoading: homeController.loading.value,
        child: SingleChildScrollView(
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                HomeAppBar(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),

                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountHomeWidget(),
                        SizedBox(
                          height: 16,
                        ),
                        SliderBannerWidget(),
                        SizedBox(
                          height: 20,
                        ),

                        AppIntroWidget(),
                        OffersTitleShowAllWidget(title: 'coupons'.tr, onShowAllPressed: onShowOffers,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:  Row(
                            children: controller.promoCodeService.value.promoCodes.sublist(0,controller.promoCodeService.value.promoCodes.length > 10 ? 10 : controller.promoCodeService.value.promoCodes.length).map((e) => Container(
                              height: 230,
                              width: Get.width / 2.5,
                              margin: EdgeInsets.all(3),
                              child: ItemWidget(index:controller.promoCodeService.value.promoCodes.indexOf(e)),
                            )).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CalculatePointsWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
