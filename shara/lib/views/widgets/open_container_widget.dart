import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenContainerWidget extends StatelessWidget {

  final Widget openWidget;
  final Widget closedWidget;

   OpenContainerWidget({Key? key,required this.openWidget,required this.closedWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.to(() => openWidget);
            },
      child: closedWidget,
    );
    return OpenContainer(
      closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context,action){
      return closedWidget;
    }, openBuilder: (context,action){
      return openWidget;
    });
  }
}
