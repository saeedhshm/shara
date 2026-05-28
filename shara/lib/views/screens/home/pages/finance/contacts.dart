import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/transfer_points_controller.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
import 'package:shara/views/screens/home/pages/finance/transfer_to_contact.dart';
import 'package:shara/views/screens/home/pages/finance/widgets/ContactListItemWidget.dart';

import '../../../../../helpers/app_colors.dart';
import '../../../../../models/app_contact.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key}) : super(key: key);

  final TransferPointsController controller =
      Get.put(TransferPointsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'contacts'.tr,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          )),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainLightColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextFormField(
                          onChanged: (String value) {
                            controller.searchFor(name: value);
                          },
                          decoration: InputDecoration(
                              hintText: 'search_by_name'.tr,
                              border: InputBorder.none),
                        )),
                        Container(
                          // width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.mainGoldenDarkColor,
                              borderRadius: BorderRadius.circular(100)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                 InkWell(
                   onTap: (){
                     Get.to(TransferToContactPage(contact: null as AppContact));
                   },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainGoldenDarkColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16),
                      child: Text(
                        'transfer_to_unregistered'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: controller.loading.value
                      ? Center(
                    child: LoadingIndicatorWidget(),
                  )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            AppContact contact = controller.contacts[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => TransferToContactPage(
                                      contact: contact,
                                    ));
                              },
                              child: ContactListItemWidget(contact),
                            );
                          },
                          itemCount: controller.contacts.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 8,
                          ),
                        ),
                )
              ],
            ),
          )),
    );
  }

  // Future<List<Contact>> getContacts() async{
  //   bool isGranted = await Permission.contacts.status.isGranted;
  //   if(!isGranted){
  //     isGranted = await Permission.contacts.request().isGranted;
  //   }
  //
  //   if(isGranted){
  //     return await FastContacts.allContacts;
  //   }
  //
  //   return [];
  // }
}
