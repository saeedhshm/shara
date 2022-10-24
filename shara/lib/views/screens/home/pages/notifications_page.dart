import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/notifications.dart';
import 'package:shara/views/widgets/network_image.dart';

import '../../../../helpers/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'notifications'.tr,
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: controller.notifications.length > 0
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        var notification = controller.notifications[index];
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    child: imageFromServer(
                                      imageUrl: notification.image,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.white, width: 3)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text(
                                      notification.descr,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month_outlined)
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainLightColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.notifications.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 4,
                        );
                      },
                    )
                  : Center(
                      child: Text('no_notis_yet'.tr),
                    ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<NotificationsController>();
    super.dispose();
  }
}
