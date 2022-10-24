import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shara/controllers/init_app_controller.dart';
import 'package:shara/controllers/login_controller.dart';
import 'package:shara/helpers/navigation.dart';
import 'package:shara/helpers/utils/printutils.dart';
import 'package:shara/views/screens/account/login.dart';
import 'package:shara/views/screens/home/main_home_screen.dart';
import 'package:shara/views/screens/splash/intro_page.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, }) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int count = 0;
  Timer timer;
  var tryingLogging = false;
  var loogedUser = false;

  VideoPlayerController _controller;

  InitAppController initAppController = Get.find();
  LoginController loginController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [
      SystemUiOverlay.bottom ,
      SystemUiOverlay.top ,
    ]);

    _controller = VideoPlayerController.asset('assets/video/shara_intro.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // _controller.setLooping(true);
    _controller.play();

    timer = Timer.periodic(Duration(milliseconds: 0), (t){
      count++;
      setState(() {

      });


      if(!_controller.value.isPlaying && tryingLogging){
        timer.cancel();
        if(loogedUser){
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => MainHomeScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
          // Go.toAndOff(context, MainHomeScreen());
        } else{
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => IntroPage(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
          // Go.toAndOff(context, LoginPage());
        }
      }


    });

    Future.delayed(Duration(milliseconds: 3000),(){

     if(initAppController.userData.value.user != null){


       loginController.password =  initAppController.userData.value.user.password ?? '';
       loginController.email = initAppController.userData.value.user.email ?? '';

       loginController.loginAction((mssg){

         if(mssg == null){
           loogedUser = true;
         } else{
           loogedUser = false;
         }
         tryingLogging = true;
       });
     }else{
       tryingLogging = true;
     }
   });



  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:AnimatedSwitcher(

        duration: const Duration(milliseconds: 0),


        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
      ),
    );
  }

  Widget widgetImgs(){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash/${count%3}.png')   ,
              fit: BoxFit.cover
          )
      ),
      key: ValueKey<int>(count),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    timer.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);  // to re-show bars
    super.dispose();
  }


}
