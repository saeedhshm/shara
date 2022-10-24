// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shara/controllers/init_app_controller.dart';
// import 'package:shara/helpers/app_colors.dart';
// import 'package:shara/helpers/utils/printutils.dart';
// import 'package:shara/helpers/utils/widgets/loading_indicator.dart';
// import 'package:shara/models/partner.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:io';
// import 'package:url_launcher/url_launcher.dart';
//
//
// class PartnerPage extends StatefulWidget {
//
//   final Partner partner;
//
//   const PartnerPage(this.partner,{Key key}) : super(key: key);
//
//   @override
//   State<PartnerPage> createState() => _PartnerPageState();
// }
//
// class _PartnerPageState extends State<PartnerPage> {
//
//
//   var loading = true;
//   InitAppController initApp = Get.find();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _launchUrl(widget.partner.storeUrl);
//     Get.back();
//     if (Platform.isAndroid) WebView.platform = AndroidWebView();
//
//   }
//
//   void _launchUrl(String url) async {
//     final Uri _url = Uri.parse(url);
//     if (!await launchUrl(_url)) throw 'Could not launch $_url';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: AppColors.mainLightColor,
//           elevation: 0,
//           title: Text(
//             widget.partner.partnerName(initApp.isArabicLang),
//             style: TextStyle(
//                 color: AppColors.mainDarkGreyColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18),
//             maxLines: 3,
//           ),
//           leading: Container(
//             child: InkWell(
//               onTap: (){
//                 Get.back();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           )),
//       body: Container(
//         child: Stack(
//           children: [
//             WebView(
//               initialUrl: widget.partner.storeUrl,
//               onProgress: (int progress){
//                 println('---->>>>> onProgress $progress');
//                 if(progress == 100)  {
//                   loading = false;
//                   setState(() {
//
//                   });
//                 }
//               },
//               onPageFinished: (str){
//                 println('---->>>>> onPageFinished $str');
//               },
//               onPageStarted: (str){
//                 println('---->>>>> onPageStarted $str');
//               },
//             ),
//             loading ? Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 color: Colors.black.withOpacity(0.1),
//                 child: Center(child: LoadingIndicatorWidget())) : SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
// }
