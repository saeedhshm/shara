import 'package:flutter/material.dart';

class LeadingBackArrow extends StatelessWidget {

  final double size;
  final Function? onBack;
  const LeadingBackArrow({Key? key,this.size = 40,this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        if(onBack != null) onBack!();
            },
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.all(0.0),
        child: Icon(Icons.arrow_back,color: Colors.black,size: size,),
      ),
    );
  }
}
