import 'package:flutter/material.dart';
import 'package:shara/controllers/promo_codes_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:get/get.dart';

import 'package:shara/helpers/utils/widgets/loading_indicator.dart';

import '../../../../../models/promo_code_type.dart';
import 'item_widget.dart';

class OffersOfPointsScreen extends StatefulWidget {
  final void Function()? onBack;

  OffersOfPointsScreen({Key? key, required this.onBack}) : super(key: key);

  @override
  State<OffersOfPointsScreen> createState() => _OffersOfPointsScreenState();
}

class _OffersOfPointsScreenState extends State<OffersOfPointsScreen> {

  ScrollController? scrollController;
  PromoCodeController controller =  Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController!.removeListener(_scrollListener);
    scrollController!.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // print(scrollController.position.extentAfter);
    if (scrollController!.position.extentAfter == 0.0) {
      controller.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            'replace_points'.tr,
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,size: 30,color: AppColors.mainGoldenDarkColor,),
            )
          ],
          leading: Container(
            child: InkWell(
              onTap: widget.onBack,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          )),


      body: Obx(()=>Container(

        child:Column(
          children: [
            SizedBox(height: 10,),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 16,),
                    for(int i = 0;i< controller.promocodeTypeService.value.productsTypes.length;i++)
                      GestureDetector(
                        onTap: (){
                          var id = controller.promocodeTypeService.value.productsTypes[i].id;
                          for(var type in controller.promocodeTypeService.value.productsTypes){
                            if(type.id == id){
                              type.selected = true;

                            }else{
                              type.selected = false;
                            }
                          }
                          controller.getSelectedTypePromoCodes(id ?? 0);
                        },
                        child: TypeItemWidget(controller.promocodeTypeService.value.productsTypes[i]),
                      ),
                    SizedBox(width: 8,),
                  ],
                ),
              ),
            ),

            Expanded(child: controller.loading.value? Center(
              child: LoadingIndicatorWidget(),
            ) :
            RefreshIndicator(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child:controller.promoCodeService.value.promoCodes.length == 0 ? Center(
                child: Text("no_items_in_category".tr),
              ) : GridView.builder(
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.70),
                itemCount: controller.promoCodeService.value.promoCodes.length,
                itemBuilder: (contx, indx) {

                  return ItemWidget(index:indx);
                },
              ),
            ), onRefresh: controller.onPullToRefresh)),
            Container(

              margin: EdgeInsets.all(8),
              child:controller.subLoading.value ? LoadingIndicatorWidget() : SizedBox(),
            )
          ],
        ),
      )),
    );
  }
}

class TypeItemWidget extends StatelessWidget {
  final ProductsTypes type;
  const TypeItemWidget(this.type,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(

          decoration: BoxDecoration(
              color: type.selected ? AppColors.mainGoldenDarkColor : AppColors.mainLightColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.mainGoldenDarkColor,width: 0.75)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Text(
               type.name!.tr,
              style: TextStyle(
                color: type.selected ? Colors.white : Colors.black
              ),
            ),
          ),
        ),
        SizedBox(width: 8,),

      ],
    );
  }
}

