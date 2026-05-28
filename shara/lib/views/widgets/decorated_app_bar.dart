import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';

class DecoratedAppBar extends StatelessWidget implements PreferredSizeWidget{

   final Widget child;
   DecoratedAppBar({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight+10);
}
