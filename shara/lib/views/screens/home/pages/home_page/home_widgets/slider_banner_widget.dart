import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/home_controller.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/views/widgets/network_image.dart';

class SliderBannerWidget extends StatefulWidget {

   SliderBannerWidget({Key? key}) : super(key: key);

  @override
  State<SliderBannerWidget> createState() => _SliderBannerWidgetState();
}

class _SliderBannerWidgetState extends State<SliderBannerWidget> {

  ScrollController scrollController = ScrollController();
  HomeController homeController  = Get.find();
  InitAppController initAppController = Get.find();

  Timer? _timer;
  int index = 0;
  double sliderWidth = 0.0;
  @override
  void initState() {
    super.initState();
    startTimer();

  }

  void startTimer() {
    const oneSec = const Duration(seconds: 3);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
            scrollController.animateTo(
             (index * (sliderWidth + 8)).toDouble(),
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
            );
            index += 1;
            if(index == homeController.homeData.value.sliders.length) {
              index = 0;
            }
            setState(() {

            });
      },
    );

  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    sliderWidth =  MediaQuery.of(context).size.width - (16 * 2);

    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 190,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: homeController.homeData.value.sliders.length,
                  itemBuilder: (cont,index){
                    return SizedBox(
                      height: 150,
                      width: sliderWidth,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: loadImage(homeController.homeData.value.sliders[index].image(initAppController.isArabicLang),fit: BoxFit.fill)),
                    );
                  }, separatorBuilder: (BuildContext? context, int index) {
                  return SizedBox(width: 8,);
                },
                ),
              ),
              // SizedBox(
              //   height: 45,
              // ),
            ],
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Obx((){
        //     return Row(
        //       // crossAxisAlignment: CrossAxisAlignment.s,
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: homeController.homeData.value.partners.map((e) => InkWell(
        //         onTap: () async {
        //           final Uri _url = Uri.parse(e.storeUrl);
        //           if (!await launchUrl(_url)) throw 'Could not launch $_url';
        //           // Get.to(() => PartnerPage(e));
        //         },
        //         child: Container(
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(50),
        //               border: Border.all(
        //                   color: AppColors.borderTextFieldColor,
        //                   width: 0)),
        //           height: 60,
        //           width: 65,
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(50),
        //             child: imageFromServer(imageUrl: e.logo,fit: BoxFit.contain),
        //           ),
        //         ),
        //       ),).toList(),
        //     );
        //   }),
        // )
      ],
    );
  }
}
