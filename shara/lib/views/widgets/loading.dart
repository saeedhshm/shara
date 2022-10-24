import 'package:flutter/material.dart';
import 'package:shara/views/widgets/rotating_widget.dart';

import '../../helpers/utils/widgets/loading_indicator.dart';
// import 'package:spring/spring.dart';



Widget get loadingWidget{
  return _LoadingIndicatorWidget();
}

Widget get loadingImageWidget{
  return Center(child: LoadingIndicatorWidget());
}

Widget get sendingWidget{
  return Center(child: LoadingIndicatorWidget());
}

class _LoadingIndicatorWidget extends StatefulWidget {
  @override
  _LoadingIndicatorWidgetState createState() => _LoadingIndicatorWidgetState();
}

class _LoadingIndicatorWidgetState extends State<_LoadingIndicatorWidget> {

  // final _key = GlobalKey<SpringState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // return Center(child: CircularProgressIndicator());

    return Center(
      child: SpinKitRotatingCircle(Image.asset('assets/imgs/z-icon.png'),color: Colors.white),
    ) ;

    // return Center(
    //     child: SizedBox(
    //       width: 100,height: 100,
    //       child: Rotate(
    //         // beatsPerMinute: 80,
    //         repeat: true,
    //         rotationsPerMinute: 50,
    //         // duration: Duration(seconds: 5),
    //         child: logoImage,
    //       ),
    //     ),
    //   );
  }

  Widget get logoImage   {
    return Image.asset('assets/imgs/z-icon.png',width: 100,height: 100,);
  }
}
