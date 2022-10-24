import 'dart:convert';

import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/api.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/membership_ervice.dart';

class MembershipDetailsController extends GetxController{

  var isLoading = true.obs;
  var membershipDetails = Membership().obs;

  getMembershipDetails(){
    isLoading.value = true;
    AppApiHandler.getData(url: '$membershipUrl/${membershipDetails.value.id}', callback: (json){
      println();
      println('------------------------------ membershipDetails');
      println(json);
      membershipDetails.value.cloneObject(Membership.fromJson(json));
      println('------------------------------ membershipDetails');
      println();
      isLoading.value = false;
    });
  }
}