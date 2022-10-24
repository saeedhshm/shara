import 'dart:async';

import 'package:get/get.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/models/notification.dart';

class NotificationsController extends GetxController{
  var notifications = <Notification>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    notifications.add(Notification());
    notifications.add(Notification());
    notifications.add(Notification());
    notifications.add(Notification());
    notifications.add(Notification());
    notifications.add(Notification());
    notifications.add(Notification());
  }
}