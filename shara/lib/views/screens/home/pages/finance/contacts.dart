import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/views/screens/home/pages/finance/transfer_to_contact.dart';

import '../../../../../helpers/app_colors.dart';

class ContactsPage extends StatelessWidget {

   ContactsPage({Key key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.mainLightColor,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SizedBox(width: 8,),
                    Expanded(child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'search_by_name'.tr,
                          border: InputBorder.none
                      ),
                    )),
                    Container(
                      // width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                        child: Icon(Icons.search,size: 30,color: Colors.white,),
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.mainGoldenDarkColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.mainGoldenDarkColor,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 16),
                child: Text('transfer_to_unregistered'.tr,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(child: ListView.separated(itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(()=>TransferToContactPage());
                },
                child: Container(
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
                              Text('المعتصم بالله',style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.mainDarkGreyColor
                              ),),
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  Text('${'end_with'.tr}9940',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.navBarUnselectedIconsColor
                                  ),),
                                  Spacer(),
                                  Text('Riyad bank',style: TextStyle(
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
                ),
              );
            },itemCount: 15, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16,),))
          ],
        ),
      ),
    );
  }
}
