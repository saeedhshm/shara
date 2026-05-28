import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {

  final Widget child;
  final Color color;
  final void Function()? onPressed;
  FlatButtonWidget({Key? key,required this.child,required this.color,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: child),
        ),
      ),
    );
  }
}
