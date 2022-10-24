import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {

   LoadingIndicatorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(AppColors.mainGoldenDarkColor) ,);
  }
}
