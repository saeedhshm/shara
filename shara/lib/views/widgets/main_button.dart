import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';

class MainButtonWidget extends StatelessWidget {

  final String btnTitle;
  final Function ()onPressed;
   MainButtonWidget({Key? key,required this.btnTitle,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(btnTitle,
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: AppColors.mainGoldenDarkColor,
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
