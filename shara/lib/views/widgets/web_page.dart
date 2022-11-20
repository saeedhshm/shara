import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
import 'package:shara/helpers/utils/widgets/snack_bars.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';


class WebPage extends StatefulWidget {

  final String url;

  const WebPage(this.url,{Key key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {


  InitAppController initApp = Get.find();

  bool paymentDone = false;
  bool paymentSucceed = false;
  Timer timer;
  bool loading = true;

  String errorMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _launchUrl(widget.url);
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

  }

  // void _launchUrl(String url) async {
  //   final Uri _url = Uri.parse(url);
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.mainLightColor,
          elevation: 0,
          title: Text(
            '',
            style: TextStyle(
                color: AppColors.mainDarkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            maxLines: 3,
          ),
          leading: Container(
            child: InkWell(
              onTap: (){
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
      body: Container(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: [
                JavascriptChannel(name: 'Print', onMessageReceived: (message) {
                  // Navigator.of(context).pop();
                  paymentDone = true;
                  int productId = int.tryParse(message.message);

                  if(productId != null){
                    paymentSucceed = true;

                    timer = Timer(Duration(seconds: 0), () {
                      SnackBars.showConfirmedSnackBar('', 'success_payment'.tr);
                    });
                  }else{
                    paymentSucceed = false;
                    errorMessage = message.message;
                    SnackBars.showErrorSnackBar('error'.tr, 'unsuccess_payment'.tr);
                  }

                  setState(() {});

                })
              ].toSet(),
              initialUrl: widget.url,
              onPageFinished: (done){
                setState(() {
                  loading = false;
                });
              },
            ),
            loading ? Center(
              child: LoadingIndicatorWidget(),
            ) : Container()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}
