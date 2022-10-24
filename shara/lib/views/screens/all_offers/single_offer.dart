import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/offer_details_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';
import 'package:shara/views/widgets/network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleOfferPage extends StatefulWidget {
   SingleOfferPage({Key key}) : super(key: key);

  @override
  State<SingleOfferPage> createState() => _SingleOfferPageState();
}

class _SingleOfferPageState extends State<SingleOfferPage> {

  OfferDetailsController controller = Get.find();
  InitAppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    bool isArabic = appController.isArabicLang;
    return Scaffold(
      body: Obx(()=>controller.loading.value ? Center(
          child: LoadingIndicatorWidget(),
      ) : Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 350,
                  backgroundColor: AppColors.mainLightColor,
                  title: Row(
                    children:  [
                      Spacer(),
                      GestureDetector(
                        onTap:(){

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset('assets/images/icons/offer/share.png',width: 35,),
                        ),
                      ),
                      // GestureDetector(onTap: (){
                      //
                      // }, child: Image.asset('assets/images/icons/offer/fav_in_details.png',width: 35,))
                    ],
                  ),
                  leading: LeadingBackArrow(),
                  bottom: PreferredSize(preferredSize: Size.fromHeight(0), child: SizedBox(),),
                  flexibleSpace: FlexibleSpaceBar(
                    background: imageFromServer(imageUrl: '${controller.offerDetails.image(isArabic)}',
                      fit: BoxFit.cover,),
                  ),
                ) ,
                SliverToBoxAdapter(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(width:100,height: 70,child: imageFromServer( imageUrl: controller.offerDetails.partner.logo,fit: BoxFit.contain)) ,
                          SizedBox(height: 10,),
                          // Text('متبقي 10 ايام',style: TextStyle(color: AppColors.mainLightGreyColor),),
                          // SizedBox(height: 10,),
                          //titel
                          SizedBox(width:double.infinity,child: Text(controller.offerDetails.title(isArabic), style: TextStyle(color: AppColors.mainDarkGreyColor,fontSize: 20,fontWeight: FontWeight.bold),)) ,

                          SizedBox(height: 10,),
                          //details
                          SizedBox(
                            width:double.infinity,
                            child: Text(controller.offerDetails.description(isArabic),style: TextStyle(
                                height: 1.75,
                                fontSize: 18,
                                color: AppColors.mainLightGreyColor
                            ),),
                          ) ,

                          SizedBox(height: 16,),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text('offer_online_at_shop'.tr,
            style: TextStyle(
                color: AppColors.mainGoldenDarkColor
            ),),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,right: 10,left: 10),
            child: InkWell(
              onTap: () async {

                println('----- offer url');
                println(controller.offerDetails.partner.storeUrl) ;


                final Uri _url = Uri.parse(controller.offerDetails.partner.storeUrl);
                if (!await launchUrl(_url)) throw 'Could not launch $_url';
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Center(child: Text('shop_now'.tr,style: TextStyle(color: Colors.white,fontSize: 18),)),
                decoration: BoxDecoration(
                    color: AppColors.mainGoldenDarkColor ,
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),
          )
        ],
      )
      ),
    );
  }
  


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<OfferDetailsController>() ;
  }
}
