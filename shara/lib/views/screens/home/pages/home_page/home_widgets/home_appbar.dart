import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/home_controller.dart';
import 'package:shara/helpers/app_colors.dart';

import '../../notifications_page.dart';

class HomeAppBar extends StatefulWidget {
 
    HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin{


   final homeController  = Get.find<HomeController>();

   // Animation<Offset> logoOffset;
   // AnimationController logoController;

   // Create a controller
   //   AnimationController spinningController;
   // Animation<double> spinningAnimation;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // logoController = AnimationController(
    //   duration: const Duration(milliseconds: 1500),
    //   vsync: this,
    // );

    // Create a controller
    // spinningController = AnimationController(
    //   duration: const Duration(milliseconds: 1500),
    //   vsync: this,
    // )..repeat(reverse: true);
    //
    // spinningAnimation = CurvedAnimation(
    //   parent: spinningController,
    //   curve: Curves.linear,
    // );
    
    // logoController.addListener(() {
    //   setState(() {});
    // });
    // logoController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     homeController.showLogo.value = false;
    //   }
    // });
    // logoOffset = Tween<Offset>(begin: Offset(Get.size.width, 200.0), end: Offset.zero)
    //     .animate(logoController);

     // logoController.forward();
   //   spinningController.forward();
   //  if(!homeController.showLogo.value) {
   //    logoOffset = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
   //        .animate(logoController);
   //    logoController.stop();
   //    spinningController.stop();
   // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // logoController.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).viewPadding.top;
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 16),
            child: Row(
              children: [
                 Container(

                   width:150 ,
                   child: Padding(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 8.0, vertical: 4),
                       child: Image.asset('assets/images/icons/logo.png',width: 150,)
                   ),
                 )
               ,
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>NotificationsPage());
                  },
                  child: Image.asset(
                    'assets/images/icons/bell.png',
                    width: 30,
                    color: AppColors.mainGoldenDarkColor,
                  ),
                ),
                // OpenContainer(
                //   closedElevation: 0,
                //   closedColor: Colors.transparent,
                //   transitionDuration: Duration(milliseconds: 300),
                //   openBuilder: (BuildContext? context,  action) {
                //     return NotificationsPage();
                //   },
                //   closedBuilder: (BuildContext? context, action) {
                //
                //     // return Icon(Icons.notifications_none_rounded,size: 30,color: AppColors.mainGoldenDarkColor,);
                //     return  Image.asset(
                //       'assets/images/icons/bell.png',
                //       width: 30,
                //       color: AppColors.mainGoldenDarkColor,
                //     );
                //   },
                //
                // ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
