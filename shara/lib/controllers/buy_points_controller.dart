import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/helpers/apis_urls/app_urls.dart';
import 'package:urwaypayment/urwaypayment.dart';
import '../helpers/apis_urls/api_handler.dart';
import '../helpers/utils/printutils.dart';
import 'init_app_controller.dart';

class BuyPointsController extends GetxController{

  InitAppController appController = Get.find();
  var errorMessage = ''.obs;
  var startApplePay = false.obs;


  generatePaymentUrl(String? points,onDone){
    var params = {
      'points' : points,
    }  ;

    var headers = {
      'Authorization' : 'bearer ${appController.userData.value.token?.accessToken}' ,
      "x-localization": 'lang_code'.tr,
    } ;
    ApiHandler.sendData(url: urlPaymentGeneratorUrl, callback: (json,stsCode){
      println();
      println(json);
      println();
      if(json != null && json['success']){
       var paymentUrl = 'https://sharaksa.com/api/customer/payment/checkout-mobile-redirect?link=${json['url']}';
        onDone(paymentUrl);
      }
      // onChangeDone(json['success'],json['message']) ;
    }, body: params,header: headers);
  }

  @override
  void onInit() {
    super.onInit();
  }

  void payUsingApplePay(BuildContext? context,String? points,onDone) async {
    await _performtrxn(context, '');
    onDone(replaceFarsiNumber(points));

  }

  Future<void> _performtrxn(BuildContext? context, String amount) async {

      startApplePay.value = true;
    // var priceBeforeShipping = double.tryParse(_checkOut.totalAmountAll) - double.tryParse(_checkOut.shipmentAmount) ;
      println('hkjhkjh kjhkjh');

    if (context == null) return;
    var RespResult = await Payment.makeapplepaypaymentService(
        context: context,
        country: 'SA',
        action: '1',
        currency: 'SAR',
        // amt: '',
        amt: '1.00',
        customerEmail: 'CEO@trafficksa.com',
        trackid: '${DateTime.now().millisecondsSinceEpoch}',
        udf1: '${DateTime.now().millisecondsSinceEpoch}',
        udf2: '',
        udf3: '',
        udf4: '',
        udf5: 'ook',
        tokenizationType: '',
        merchantIdentifier: "merchant.com.traffic.saeed.shara",
        companyName:'Zinco Int.', shippingCharge:'0.00',
        metadata: '', // Add empty metadata string to satisfy required parameter
    );
      println('hkjhkjh kjhkjh DateTime >>> ${DateTime.now().millisecondsSinceEpoch}');
      println('hkjhkjh kjhkjh RespResult >>> $RespResult');
    // var =  ;

    // completePurchaseVM.logMessage(RespResult +' '+'order_id: ${sra.orderId}');
    //
    // final jsonData = json.decode(RespResult);

    // var params = {
    //
    //   "order_id":'{sra.orderId}'  ,
    //   "amount" :'{_checkOut.totalAmountAll}',
    //   "unique_id": '{sra.uniqueId}'
    // };


    // if (json['result'] == 'UnSuccessful') {
    //   setState(() {
    //     startApplePay = false;
    //   });                   api/apple_log
    //   return;
    // }

    // if (jsonData['result'] == 'Successful') {
    //   // var completePurchaseVM = Provider.of<CompletePurchaseViewModel>(context,listen: false);
    //   var  tran_id = '';
    //   if(jsonData['TranId'] != null){
    //     tran_id =  jsonData['TranId'];
    //   } else if(jsonData['tranid'] != null){
    //     tran_id =  jsonData['tranid'];
    //   } else if(jsonData['Tranid'] != null){
    //     tran_id = jsonData['Tranid'];
    //   } else if(jsonData['tranId'] != null){
    //     tran_id = jsonData['tranId'];
    //   }
    //
    //   var params = {
    //     'tran_id':tran_id,
    //     "order_id":'${sra.orderId}'  ,
    //     "amount" :'${_checkOut.totalAmountAll}',
    //     "unique_id": '${sra.uniqueId}'
    //   };
    //
    //
    //   completePurchaseVM.sendAppleResponseToServer(params, (){
    //     setState(() {
    //       startApplePay = false;
    //     });
    //
    //     var cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    //     cartViewModel.clearCart();
    //     AppNavigator.navigateTo(
    //         context,
    //         ChangeNotifierProvider(
    //           create: (_) => OrderDetailsViewModel('${sra.orderId}'),
    //           child: OrderDetailsScreen(
    //             true,
    //           ),
    //         ));
    //
    //
    //   });
    // }
    // else{
    //   // setState(() {
    //   //   startApplePay = false;
    //   // });
    //   // CoolAlert.show(
    //   //   context: context,
    //   //   type: CoolAlertType.error,
    //   //   confirmBtnColor: Colors.red,
    //   //   animType: CoolAlertAnimType
    //   //       .slideInDown,
    //   //   showCancelBtn: false,
    //   //   cancelBtnText: 'OK'.tr(),
    //   //   confirmBtnText: 'OK'.tr(),
    //   //   barrierDismissible: true,
    //   //   text: "ApplePayDoseNotComplete"
    //   //       .tr(),
    //   //   title: 'خطأ'.tr(),
    //   //   // onConfirmBtnTap: () {
    //   //   //   Navigator.of(context)
    //   //   //       .pop();
    //   //   //   cartViewModel
    //   //   //       .removeItemAt(index);
    //   //   // },
    //   // );
    // }




  }

  String replaceFarsiNumber(String? input) {
    if (input == null) return '';
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String result = input;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(farsi[i], english[i]);
    }

    return result;
  }
}