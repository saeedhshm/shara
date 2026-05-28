import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/discount_coupon.dart';

import '../helpers/apis_urls/api_handler.dart';
import '../helpers/apis_urls/app_urls.dart';

class DiscountCouponsController extends GetxController{
  var copyingCoupon = false.obs;
  var loading = true.obs;
  var couponsManager = CouponsManager().obs;

  var subLoading = false.obs;
  var nomoreData = ''.obs;

  var currentPage = 1;
  var nextPage = 1;

  ScrollController? scrollController;

  getAllCoupons(){
    loading.value = true;
    currentPage = 1;
    nextPage = 1;
    ApiHandler.getData(url: '$allDiscountCouponsUrl?page=$currentPage', callback: (json){
      println('=-=-=-=-=---=- offers =-==-==-=-=-');
      println(json);
      println('=-=-=-=-=---=- offers =-==-==-=-=-');
      couponsManager.value.data.clear();

      couponsManager.value .fromJson(json);

      nextPage++;

      loading.value = false;

    });
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    getAllCoupons();
  }

  void _scrollListener() {
    // print(scrollController?.position.extentAfter);
    if(!subLoading.value) {
      if (scrollController?.position.extentAfter == 0.0) {
        this.loadMore();
      }
    }
  }

  loadMore(){


    if(couponsManager.value.nextPageUrl != null){

      if(currentPage != nextPage){
        subLoading.value = true;
        currentPage = nextPage;
        ApiHandler.getData(url: '$allDiscountCouponsUrl?page=$currentPage', callback: (json){

          couponsManager.value .fromJson(json);
          nextPage++;
          loading.value = false;
          subLoading.value = false;
        });
      }
    }else{
      // subLoading.value = true;
      // nomoreData.value = 'nomore_discount_coupons'.tr;
      subLoading.value = false;
      nomoreData.value = '';
      // Future.delayed(Duration(milliseconds: 1000),(){
      //   subLoading.value = false;
      //   nomoreData.value = '';
      // });
    }
  }


}