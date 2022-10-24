import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../account/login.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroItem> items = [];
  final PageController pageController = PageController();

  int currentIndex = 0;

  _IntroPageState() {
    items.add(IntroItem(
        image: 'assets/images/intro/1.png',
        title: 'shara',
        description: 'shara_description'.tr));
    items.add(IntroItem(
        image: 'assets/images/intro/2.png',
        title: 'points_to_cash'.tr,
        description: 'points_to_cash_description'.tr));
    items.add(IntroItem(
        image: 'assets/images/intro/3.png',
        title: 'points_to_sells'.tr,
        description: 'points_to_sells_description'.tr));
    items.add(IntroItem(
        image: 'assets/images/intro/4.png',
        title: 'points_for_u_beloveds'.tr,
        description: 'points_for_u_beloveds_description'.tr));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index){
                currentIndex = index;
                setState(() {

                });
              },
              controller: pageController,
              children: items
                  .map((e) {
                // final numLines = '\n'.allMatches(e.description).length + 1;
                // println('======--------=============>>>>>>>');
                // println(numLines);
                // println(e.description);
                // println('======--------=============>>>>>>>');
                return Container(
                      child: Column(

                        children: [
                          SizedBox(height: 80,),
                          Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Image.asset(e.image),
                          ),
                          e.title != 'shara'
                              ? Text(
                            e.title,
                            style: TextStyle(
                                color: AppColors.mainGoldenDarkColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                          )
                              : SizedBox(
                              width: 200,
                              child: Image.asset(
                                  'assets/images/intro/logo.png')),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 50),
                            child: Text(
                              e.description,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.mainLightGreyColor),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    );
              })
                  .toList(),
            ),
            Positioned(
              bottom: 70,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              child: Row(
                children: [
                  SmoothPageIndicator(

                    onDotClicked: (index){
                      currentIndex = index;
                      pageController.jumpToPage(index);
                      setState(() {

                      });
                    },
                    controller: pageController,
                    count: 4,

                    effect:SlideEffect(
                      activeDotColor: AppColors.mainGoldenDarkColor,
                      dotColor: AppColors.lightGoldenColor,
                      dotHeight: 15,
                      dotWidth: 15,
                      // radius: 0,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      if(currentIndex == (items.length - 1)){
                        goToLogin(context);
                      }else{
                        currentIndex++;
                        pageController.jumpToPage(currentIndex);
                        setState(() {

                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainGoldenDarkColor,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                        child: Text(currentIndex == (items.length - 1) ? 'start'.tr :'next'.tr,style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                      ),
                    ),
                  ),

                  // Container(
                  //   child: Row(
                  //     children: items.map((e) => GestureDetector(
                  //       onTap: (){
                  //         currentIndex = items.indexOf(e);
                  //         pageController.jumpToPage(items.indexOf(e));
                  //         setState(() {
                  //
                  //         });
                  //       },
                  //       child: AnimatedContainer(
                  //         margin: EdgeInsets.all(3),
                  //         width: currentIndex == items.indexOf(e) ? 25 : 15,
                  //         height: 15,
                  //         color:currentIndex == items.indexOf(e) ? AppColors.mainGoldenDarkColor : AppColors.lightGoldenColor, duration: Duration(milliseconds: 300),
                  //       ),
                  //     )).toList(),
                  //   ),
                  // ),




                ],
              ),
            )),
            Positioned(
                left: 0,
                right: 0,
                top: 60,
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                  child: Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){

                              goToLogin(context);

                          },
                          child: Container(
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                              child: Text('skip'.tr,style: TextStyle(
                                  color: AppColors.mainLightGreyColor,
                                  fontSize: 15
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/intro/bc.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}

goToLogin(context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => LoginPage(),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}

class IntroItem {
  String image;
  String title;
  String description;

  IntroItem({this.image, this.title, this.description});
}
