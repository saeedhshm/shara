import 'package:flutter/material.dart';
import 'package:shara/controllers/transactions_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
import 'package:shara/views/screens/account/widgets/invoice_item_widget.dart';
import 'package:shara/views/widgets/decorated_app_bar.dart';
import 'package:shara/views/widgets/leading_back_arrow.dart';
import 'package:get/get.dart';

class InvoicesProcesses extends StatelessWidget {

  InvoicesProcesses({Key? key}) : super(key: key) {
    // dateFilteringCtrl.text = 'اخر ٦ اشهر';
    // brandFilteringCtrl.text = 'brand_name_filter'.tr;
  }

  TransactionsController controller = Get.put(TransactionsController());

  // final dateFilteringCtrl = TextEditingController();
  // final brandFilteringCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container();
    controller.getAllTransactions();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: DecoratedAppBar(
        child: Row(
          children: [
            LeadingBackArrow(
              size: 30,
              onBack: Get.back,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'account_info'.tr,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      body: Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child:controller.loading.value ? Center(
          child: LoadingIndicatorWidget(),
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'proce_invoices'.tr,
              style: TextStyle(
                  color: AppColors.mainDarkGreyColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // DropDownWidget(
            //   labelText: 'date_filtering'.tr,
            //   hintText: 'date_filtering'.tr,
            //   controller: dateFilteringCtrl,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // DropDownWidget(
            //   labelText: 'brand_filtering'.tr,
            //   hintText: 'brand_name_filter'.tr,
            //   controller: brandFilteringCtrl,
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.borderTextFieldColor,
            ),
            Expanded(child: ListView.builder(
              itemCount: controller.transactionsService.transactions.length,
              itemBuilder: (BuildContext? context, int index) {
                return InvoiceItemWidget(controller.transactionsService.transactions[index]);
              },
            ))
          ],
        ),
      )),
    );
  }
}
