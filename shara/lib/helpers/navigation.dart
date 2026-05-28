import 'package:flutter/material.dart';

class Go{

  static to(BuildContext? context,dynamic page){
           Navigator.push(context!, MaterialPageRoute(
               builder: (context) => page
           )) ;
  }
  static toAndOff(BuildContext? context,dynamic page){
    Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(
            builder: (context) => page
        ),
          (route) => false,//if you want to disable back feature set to false
    );
  }

}