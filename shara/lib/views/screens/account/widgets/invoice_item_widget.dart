import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:shara/models/transaction_service.dart';

class InvoiceItemWidget extends StatefulWidget {

  final Transaction transaction;
   InvoiceItemWidget(this.transaction);

  @override
  State<InvoiceItemWidget> createState() => _InvoiceItemWidgetState();
}

class _InvoiceItemWidgetState extends State<InvoiceItemWidget> {
  bool expandedCell = false;

  @override
  Widget build(BuildContext context) {
    double rotationValue = expandedCell ?  0.5 : 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  expandedCell = !expandedCell;
                  setState(() {

                  });
                },
                child:  AnimatedRotation(
                  duration: Duration(milliseconds: 100),
                  turns: rotationValue,
                  child: Container(
                    child:Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: AppColors.mainGoldenDarkColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ) ,
              SizedBox(width: 15,),
              Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            expandedCell = !expandedCell;
                            setState(() {

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Row(
                              children: [
                                Expanded(child: Text('merchant_order_id'.tr,
                                style: TextStyle(
                                  color: AppColors.mainLightGreyColor
                                ),),),
                                Expanded(child: Text( '${widget.transaction.merchantOrderId}',style: TextStyle(
                                    color: expandedCell ? AppColors.mainGoldenDarkColor : AppColors.mainLightGreyColor
                                ),)),
                              ],
                            ),
                          ),
                        ) ,
                        expandedCell ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('mark_name'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                  Expanded(child: Text('${widget.transaction.partner.name}'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                ],
                              ),
                            ) ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('process_value'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                  Expanded(child: Text('${widget.transaction.amount}',style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                ],
                              ),
                            ) ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('${widget.transaction.type}'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                  Expanded(child: Text('${widget.transaction.points}',style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                ],
                              ),
                            ) ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('transaction_status'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                  Expanded(child: Text('${widget.transaction.status}'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                ],
                              ),
                            ) ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('date'.tr,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                  Expanded(child: Text(widget.transaction.transactionDate,style: TextStyle(
                                      color: AppColors.mainLightGreyColor
                                  ),)),
                                ],
                              ),
                            ) ,

                          ],
                        ) : SizedBox()
                      ],
                    )
                ),

            ],
          ) ,
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.borderTextFieldColor,
          ),
        ],
      ),
    );
  }
}
