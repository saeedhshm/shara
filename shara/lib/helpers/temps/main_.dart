// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shara/views/screens/splash/splash.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//
//   runApp(EasyLocalization(
//       supportedLocales: [Locale('en', ''), Locale('ar', '')],
//       path: 'assets/translations', // <-- change the path of the translation files
//       fallbackLocale: Locale('ar', ''),
//       child: MyApp()
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily: 'Almarai',
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
