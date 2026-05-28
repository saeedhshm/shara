import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';

class HeaderLoginWidget extends StatelessWidget {
  final double height;
  final Widget child;
  final isLogin;
  final onClose;
  final String? pageName;

  HeaderLoginWidget({Key? key, required this.height, required this.child,this.isLogin = false,this.onClose,this.pageName,})
      : super(key: key){
    println('----=----->> $isLogin');
    println('----=----->> $pageName');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height,
          color: AppColors.mainLightColor,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: child,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/icons/login/title_bg.png',
                width: double.infinity,
              )),
        ),
      isLogin ? SizedBox() :  Positioned(
          left: 30,
            top: 30,
            child: Container(
              // color: Colors.black54,
              child: InkWell(
                onTap: (){
                  if(onClose != null){
                    onClose();
                  }
                  Navigator.of(context).pop();
                },
                child: Icon(
          Icons.clear,
          size: 30,
          color: AppColors.mainDarkGreyColor,
        ),
              ),
            )),
      ],
    );
  }
}
