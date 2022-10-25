import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../helpers/app_colors.dart';

class ContactListItemWidget extends StatelessWidget {
  
  final Contact contact;
  const ContactListItemWidget(this.contact,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.mainLightColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              height: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/icons/home/user.png',color: Colors.grey,),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${contact.displayName}',style: TextStyle(
                      fontSize: 18,
                      color: AppColors.mainDarkGreyColor
                  ),),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('${contact.phones.first.replaceAll('-', '').replaceAll(' ', '').replaceAll('+', '00')}',style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.navBarUnselectedIconsColor
                      ),),
                      Spacer(),
                      Text('invite'.tr,style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.navBarUnselectedIconsColor
                      ),),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    ) ;
  }
}
