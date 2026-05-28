import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/views/widgets/open_container_widget.dart';

import '../../calculate_points.dart';

class CalculatePointsWidget extends StatelessWidget {

    CalculatePointsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainerWidget(openWidget: CalculatePointsPage(), closedWidget: Container(
      decoration: BoxDecoration(
        color: AppColors.mainLightColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(


          children: [
            Image.asset("assets/images/icons/home/calculate_points_icon.png",height: 40,),
            SizedBox(width: 10,),
            Container(width: 1,height: 50,color: Colors.white,),
            SizedBox(width: 10,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('points_calculator'.tr,style: TextStyle(
                    fontSize: 15
                ),),
                SizedBox(height: 3,),
                Text('points_calculator_description'.tr,style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mainLightGreyColor
                ),),
              ],
            )) ,
            Icon(Icons.arrow_forward_ios,color: AppColors.mainLightGreyColor,size: 20,)
          ],
        ),
      ),
    ));
  }
}
