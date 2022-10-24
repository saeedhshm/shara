import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showErrorSnackbar(String title, String message){
  Get.snackbar(title, message,
    colorText: Colors.white,
    backgroundColor: Colors.red,

  );
}

void showConfirmedSnackbar(String title, String message){
  Get.snackbar(title, message,
    colorText: Colors.white,
    backgroundColor: Colors.green,
    duration: Duration(milliseconds: 2500)
  );
}