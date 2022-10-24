import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'package:shara/views/widgets/svg_widget.dart';

class FinancePageItemWidget extends StatelessWidget {

  final String imageIcon;
  final String title;
  const FinancePageItemWidget({Key key,@required this.title,@required this.imageIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = Get.width;

    return SizedBox(
      width: width/2.2,
      height: width/2.3,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.peageColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: AppColors.mainGoldenDarkColor,width: 0.4)
            ),
            child: Column(
              children: [
                Expanded(child: SvgImageWidget(imageIcon)),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.mainGoldenDarkColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(child: Text(title,style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
