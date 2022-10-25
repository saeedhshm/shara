
import 'package:flutter/material.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/partners_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/widgets/loading_data_widget.dart';
import 'package:shara/models/partner.dart';
import 'package:shara/views/widgets/home_loading_widget.dart';
import 'package:shara/views/widgets/network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersPage extends StatelessWidget {

  final Function onBack;
  PartnersPage({Key key,@required this.onBack}) : super(key: key);

  PartnersController partnersController = Get.put(PartnersController());
  InitAppController initApp = Get.find();
  @override
  Widget build(BuildContext context) {
    return HomeLoadingWidget(
      isLoading: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: AppColors.mainLightColor,
            elevation: 0,
            title: Text(
              'partners'.tr,
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
        body: Container(
          padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16
          ),
          child: LoadingDataWidget(
            isLoading: partnersController.loading.value,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                 crossAxisSpacing: 16,
              mainAxisSpacing: 16
            ), itemBuilder: (context,index){
              Partner partner = partnersController.partners[index];
              return InkWell(
                onTap: () async {


                  final Uri _url = Uri.parse(partner.storeUrl);
                  if (!await launchUrl(_url)) throw 'Could not launch $_url';
                  // Get.to(() => PartnerPage(partner));
                },
                child: Container(
                  // color: Colors.amberAccent,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: AppColors.borderTextFieldColor,
                                width: 1)),
                        height: 78,
                        width: 78,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: loadImage(partnersController.partners[index].logo,fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(partner.partnerName(initApp.isArabicLang))
                    ],
                  ),
                ),
              );
            },itemCount: partnersController.partners.length,),
          ),
        ),

      ),
    );
  }
}
