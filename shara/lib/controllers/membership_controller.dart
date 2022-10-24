import 'package:get/get.dart';
import 'package:shara/models/membership_ervice.dart';

class MembershipController extends GetxController{

  var memebershipService = MemebershipService().obs;
  var loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    memebershipService.value.getMemberships((){
      loading.value = false;
    });

  }
}