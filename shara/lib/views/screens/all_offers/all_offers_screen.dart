import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shara/controllers/all_offers_controller.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/views/screens/all_offers/offers.dart';
import 'package:shara/views/widgets/list_offers_items.dart';
import 'package:shara/views/widgets/offers_title_show_all.dart';

class  AllOffersScreen extends StatelessWidget {

  // List<String> items = [
  //   'عروض الازياء والملابس'    ,
  //   'عروض المطاعم' ,
  //   'عروض الأطفال'
  // ];

  final Function onBack;
  final allOffersController = Get.put(AllOffersController());
  InitAppController initAppController = Get.find();

  AllOffersScreen({Key key,this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Obx(()=>LoadingDataWidget(isLoading: allOffersController.loading.value, child: Scaffold(
      body: Container(
        width: size.width,
        color: Colors.white,
        // color: AppColors.mainLightColor,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.mainLightColor,
              elevation: 0,
              title: Text(
                'shara_offers'.tr,
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
          body: Column(
            children: [
              // Container(
              //   width: size.width,
              //   height: 65,
              //   color: AppColors.mainLightColor,
              //   child: Padding(
              //     padding: const EdgeInsets.all(0.0),
              //     child: Row(
              //       children: [
              //         InkWell(
              //           onTap:onBack,
              //           child: Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Icon(Icons.arrow_back),
              //           ),
              //         ),
              //
              //         Text('shara_offers'.tr,style: TextStyle(
              //             color: AppColors.mainDarkGreyColor,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold
              //         ),),
              //
              //       ],
              //     ),
              //   ),
              // ) ,
              Expanded(child: Container(
                padding:  EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.white ,
                child:ListView.separated(
                    itemBuilder: (cont,index){

                      return Column(
                        children: [
                          OffersTitleShowAllWidget(padding: 0,title: allOffersController.allOffersService.value.data[index].name(initAppController.isArabicLang), onShowAllPressed:null),


                          // OpenContainer(closedBuilder: (context,action){
                          //   return
                          //     OffersTitleShowAllWidget(padding: 0,title: allOffersController.allOffersService., onShowAllPressed:null);
                          // }, openBuilder: (context,action){
                          //   return OffersPage(title: items[index],);
                          // },closedElevation: 0,transitionDuration: Duration(milliseconds: 300),),
                          SizedBox(height: 20,),
                          ListOffersItemsWidget(allOffersController.allOffersService.value.data[index].offers)
                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox();
                    },
                    itemCount: allOffersController.allOffersService.value.data.length) ,
              )),

            ],
          ),
        ),
      ),
    )));
  }
}
