import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/views/widgets/custom_listview_widget.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../../models/operations_manager.dart';
import '../../../../widgets/leading_back_arrow.dart';
import 'item_widget.dart';

class LastOperationsScreen extends StatelessWidget {
  LastOperationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'last_operations'.tr,
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          leading: Container(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: LeadingBackArrow(
                size: 30,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyCustomListView(
          onRefresh: () async {},
          itemCount: 15,
          separatorBuilder: (BuildContext, int) {
            return SizedBox(
              height: 8,
            );
          },
          scrollController: ScrollController(),
          itemBuilder: (BuildContext, index) {
            return LastOperationItem(OperationItem(index));
          },
        ),
      ),
    );
  }
}
