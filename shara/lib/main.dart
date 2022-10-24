import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/login_controller.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/screens/splash/splash.dart';
import 'helpers/translattion/local_strings.dart';
import 'package:flutter/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  InitAppController initApp = Get.put(InitAppController());
  await registerNotification();
  await initApp.getSavedLangCode();
  Get.lazyPut(() => LoginController());
  runApp(MyApp());

}

void registerNotification() async {
  // 1. Initialize the Firebase app
  await Firebase.initializeApp();
   FirebaseMessaging _messaging;
  // 2. Instantiate Firebase Messaging
  _messaging = FirebaseMessaging.instance;

  // 3. On iOS, this helps to take the user permissions
  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    // TODO: handle the received notifications
  } else {
    print('User declined or has not accepted permission');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  InitAppController initApp = Get.find();
  @override
  Widget build(BuildContext context) {
    println('----->>>>>> initApp.savedLangCode ${initApp.savedLangCode} ') ;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: OverlaySupport(
        child: GetMaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          locale: Locale(initApp.savedLangCode),
          translations: LocalString(),
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              centerTitle: false
            ),
            fontFamily: 'Almarai',
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
          // home: ProfilePage()
          // home: LoginPage(),
          // home: MainHomeScreen(),
        ),
      ),
    );
  }
}

