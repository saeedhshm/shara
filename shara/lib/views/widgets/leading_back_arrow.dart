import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadingBackArrow extends StatelessWidget {

  final double size;
  const LeadingBackArrow({Key key,this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.back();
      },
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.all(0.0),
        child: Icon(Icons.arrow_back,color: Colors.black,size: size,),
      ),
    );
  }
}
