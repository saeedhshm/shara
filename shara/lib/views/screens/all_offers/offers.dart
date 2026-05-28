import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/screens/all_offers/single_offer.dart';

class OffersPage extends StatelessWidget {
  final String title;

  const OffersPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Hero(
              tag: title,
              child: Text(
                title,
                style: TextStyle(
                    color: AppColors.mainDarkGreyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                maxLines: 3,
              )),
          leading: Container(
            child: InkWell(
              onTap: () {
                Get.back();
              },
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'filter'.tr,
                          style: TextStyle(
                              fontSize: 14, color: AppColors.mainDarkGreyColor),
                        ),
                        Icon(Icons.filter_alt_outlined,
                            size: 18, color: AppColors.mainDarkGreyColor)
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.mainLightColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Icon(
                      Icons.menu,
                      color: AppColors.mainDarkGreyColor,
                      size: 18,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mainLightColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Icon(
                      Icons.widgets_outlined,
                      color: AppColors.mainDarkGreyColor,
                      size: 18,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.mainLightColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7),
                itemBuilder: (cont, index) {
                  return OpenContainer(
                    closedBuilder: (context, action) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/holders/offer.png',
                                  fit: BoxFit.cover,
                                  width: (size.width / 1.5),
                                  height: 150,
                                ),
                                Positioned(
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.mainDarkGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 30,
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(
                                            'assets/images/icons/home/heart.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'brand_name'.tr,
                              style: TextStyle(
                                  color: AppColors.mainDarkGreyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: (size.width / 1.5),
                              child: Text(
                                'offer_data'.tr,
                                style: TextStyle(
                                    color: AppColors.mainLightGreyColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    openBuilder: (context, action) {
                      return SingleOfferPage();
                    },
                    closedElevation: 0,
                    transitionDuration: Duration(milliseconds: 500),
                  );
                },
                itemCount: 8,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
