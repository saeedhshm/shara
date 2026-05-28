import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/offer_details_controller.dart';
import 'package:shara/models/offer.dart';
import 'package:shara/views/screens/all_offers/single_offer.dart';

import 'offer_item_widget.dart';

class ListOffersItemsWidget extends StatelessWidget {

  List<Offer> offers;

   ListOffersItemsWidget(this.offers);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.red,
      height: 280,
      width: size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return OpenContainer(closedBuilder: (cont,_){
            return OfferItemWidget(offers[index]);
          }, openBuilder: (c,_){
            Get.put(OfferDetailsController(offers[index].id ?? 0));
            return SingleOfferPage();
          },closedElevation: 0,);
        },
        separatorBuilder: (BuildContext? context, int index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }
}
