import 'package:flutter/material.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../../models/operations_manager.dart';
import '../../../../widgets/network_image.dart';

class LastOperationItem extends StatelessWidget {

  final OperationItem operationItem;
   LastOperationItem(this.operationItem,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(child: Container(
            child: loadImage(operationItem.icon),
          decoration: BoxDecoration(
          shape: BoxShape.circle
      ),
      ),width: 65,height: 65,),
          SizedBox(width: 5,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(operationItem.brandName,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 16,),
              Text(operationItem.desc,style: TextStyle(
                color: AppColors.fontLightGreyColor
              ),)
            ],
          )),
          SizedBox(width: 3,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(operationItem.opCost,style: TextStyle(
                  color: AppColors.mainGoldenDarkColor
              )),
              SizedBox(height: 16,),
              Text(operationItem.opTime,style: TextStyle(
                  color: AppColors.fontLightGreyColor
              ))
            ],
          )
          
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.mainLightColor,
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
