import 'package:flutter/material.dart';

class FavoriteIconWidget extends StatefulWidget {

  final double size;

  const FavoriteIconWidget({Key? key,this.size = 35,}) : super(key: key);

  @override
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {

  bool favPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
           favPressed = true;
           setState(() {

           });
           Future.delayed(Duration(milliseconds: 200),(){
             favPressed = false;
             setState(() {

             });
           }) ;
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
        // color: Colors.red,
        width:favPressed ? 0 : widget.size,
        height:favPressed ? 0 : widget.size,
        child: Center(
          child: Image.asset(
            'assets/images/icons/offer/FAV.png',width: widget.size,height: widget.size,),
        ),
      ),
    );
  }
}
