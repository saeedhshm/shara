import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shara/controllers/home_controller.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/views/screens/home/pages/home_page/home_widgets/finance_widget.dart';
import 'package:shara/views/screens/home/pages/last_ops/last_operations.dart';
import 'package:shara/views/widgets/offers_title_show_all.dart';

import '../../../../../controllers/promo_codes_controller.dart';
import '../../../../../helpers/app_colors.dart';
import '../../../../../models/operations_manager.dart';
import '../last_ops/item_widget.dart';
import '../promo_codes/item_widget.dart';
import 'home_widgets/acoount_widget.dart';
import 'home_widgets/app_intro_widget.dart';
import 'home_widgets/calculate_points_widget.dart';
import 'home_widgets/home_appbar.dart';
import 'home_widgets/slider_banner_widget.dart';


class HomePage extends StatefulWidget {

  final Function onShowOffers;

  HomePage({Key key,this.onShowOffers}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final InitAppController initAppController = Get.find();

  final homeController  = Get.find<HomeController>();

  PromoCodeController controller =  Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAppController.getUserProfileInfo();
  }

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
                        FinanceWidget(),
                        SizedBox(
                          height: 20,
                        ),

                        kReleaseMode ? SliderBannerWidget() : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),

                        AppIntroWidget(),
                        OffersTitleShowAllWidget(title: 'coupons'.tr, onShowAllPressed: null,),
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

                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'last_operations'.tr,
                                style: TextStyle(
                                    color: AppColors.mainDarkGreyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ),
                        for(int i = 0; i< 4; i++)
                          Column(
                            children: [
                              LastOperationItem(OperationItem(i)),
                              SizedBox(height: 8,)
                            ],
                          ),
                        Container(
                          width: double.infinity,
                          child: InkWell(
                            onTap: (){
                              Get.to(()=>LastOperationsScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'show_last_operations'.tr,
                                      style: TextStyle(
                                          color: AppColors.mainGoldenDarkColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                      maxLines: 3,
                                    ),
                                    Image.asset('assets/images/icons/home/double_arrows.png',height: 20,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
