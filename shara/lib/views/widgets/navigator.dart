import 'package:flutter/material.dart';

class NavigateTo extends StatelessWidget {

  final dynamic secondPage;
  final Widget child;

  const NavigateTo({required this.secondPage,required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  secondPage),
        );
      },
      child: child,
    );
  }
}
