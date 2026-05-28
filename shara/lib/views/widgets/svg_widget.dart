import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SvgImageWidget extends StatelessWidget {

  final String imageName;
  final Color? color;

  const SvgImageWidget(this.imageName,{Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
          imageName,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        placeholderBuilder: (context){
            return imageName.toLowerCase().contains('png') || imageName.toLowerCase().contains('jpg') || imageName.toLowerCase().contains('jpeg')? Image.asset(imageName,color: color,) : Image.asset('assets/images/icons/no_image.png');
        },
      ),
    );
  }
}
