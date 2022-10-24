import 'package:flutter/material.dart';


class HomeLoadingWidget extends StatelessWidget {

  final bool isLoading;
  final Widget child;
  HomeLoadingWidget({Key key,@required this.child,@required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
           child,
           Visibility(
             visible: isLoading,
             child: Container(
               width: size.width,
               height: size.height,
               color: Colors.black.withOpacity(0.2),
               child:Center(child: CircularProgressIndicator()),
             ),
           )
      ],
    );
  }
}
