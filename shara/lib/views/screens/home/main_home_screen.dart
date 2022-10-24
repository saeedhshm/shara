import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/screens/all_offers/all_offers_screen.dart';
import 'package:shara/views/screens/home/pages/finance/finance_page.dart';
import 'package:shara/views/screens/home/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:shara/views/screens/home/pages/memberships.dart';
import 'package:shara/views/screens/home/pages/promo_codes/offers_points.dart';
import 'package:shara/views/screens/partners/all_partners.dart';

import '../../../controllers/home_controller.dart';
import '../../../controllers/promo_codes_controller.dart';

class MainHomeScreen extends StatefulWidget {



  MainHomeScreen({Key key}) : super(key: key);


  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  Size size;
  ScrollController _scrollController = new ScrollController();

  PromoCodeController controller =  Get.put(PromoCodeController());
  final homeController  = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    return WillPopScope(child: Scaffold(
      body: Container(
        color: AppColors.mainLightColor,
        child: Column(
          children: [

            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.mainLightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight:Radius.circular(25),
                  )
              ),
              child: Container(
                child: ListView(
                  controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: size.width, child: HomePage(onShowOffers: (){
                      _gotoSelectedTap(1);
                    },)),
                    SizedBox(width: size.width, child: FinancePage()),
                    SizedBox(width: size.width, child: PartnersPage(onBack: (){
                      _gotoSelectedTap(0);
                    },),),
                    SizedBox(width: size.width,child: OffersOfPointsScreen(onBack: (){
                      _gotoSelectedTap(0);
                    },), ),
                    SizedBox(width: size.width,child: MembershipPage(), )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: AppColors.mainLightColor, //
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Image.asset('assets/images/icons/bottom_bar/HOME.png',color: AppColors.navBarUnselectedIconsColor,width: 20,height: 20,),
            activeIcon:Image.asset('assets/images/icons/bottom_bar/HOME.png',color: AppColors.mainGoldenDarkColor,width: 25,height: 25,),
            label: 'home'.tr,
            //   title: FittedBox(child: Text('home'.tr),)
          ),
          BottomNavigationBarItem(
              icon:Image.asset('assets/images/icons/bottom_bar/MENU.png',color: AppColors.navBarUnselectedIconsColor,width: 20,height: 20,),
              activeIcon:Image.asset('assets/images/icons/bottom_bar/MENUACTIVE.png',color: AppColors.mainGoldenDarkColor,width: 25,height: 25,),
              label: 'finance'.tr,
              // title: FittedBox(child: Text('offers'.tr),)
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/images/icons/bottom_bar/PARTNER.png',color: AppColors.navBarUnselectedIconsColor,width: 20,height: 20,),
            activeIcon:Image.asset('assets/images/icons/bottom_bar/PARTNER.png',color: AppColors.mainGoldenDarkColor,width: 25,height: 25,),
            label: 'partners'.tr,
            //   title: FittedBox(child: Text('partners'.tr),)
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/images/icons/home/coupon.png',color: AppColors.navBarUnselectedIconsColor,width: 20,height: 20,),
            activeIcon:Image.asset('assets/images/icons/home/coupon.png',color: AppColors.mainGoldenDarkColor,width: 25,height: 25,),
            label: 'coupons'.tr,
            // title: FittedBox(child: Text('coupons'.tr),)
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/images/icons/home/user.png',color: AppColors.navBarUnselectedIconsColor,width: 20,height: 20,),
            activeIcon:Image.asset('assets/images/icons/home/user.png',color: AppColors.mainGoldenDarkColor,width: 25,height: 25,),
            label: 'accounts'.tr,
              // title: FittedBox(child: Text('accounts'.tr),)

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.mainGoldenDarkColor,
        unselectedItemColor: AppColors.navBarUnselectedIconsColor,
        showUnselectedLabels: true,
        selectedFontSize: 13,
        iconSize: 20,

        unselectedFontSize: 11,
        elevation: 50,
        onTap: _gotoSelectedTap,
      ),
    ), onWillPop: ()async{
               if(_selectedIndex == 0)
                 return true;
               _selectedIndex = 0;
               setState(() {

               });
               _scrollController.animateTo(
                 size.width * _selectedIndex,
                 curve: Curves.easeOut,
                 duration: const Duration(milliseconds: 300),
               );
      return false;
    });
  }

  _gotoSelectedTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _scrollController.animateTo(
      size.width * index,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
