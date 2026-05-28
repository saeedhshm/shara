import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';

import 'loading.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


Widget loadImage(String? name,{fit = BoxFit.cover,double? width,double? height}){
  if(name == null || name.isEmpty) {
    return Image.asset(
      "assets/images/icons/no_image.png",
      color: AppColors.fontLightGreyColor,
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    );
  }
  if(name.contains('http') ){
   return _imageFromServer(imageUrl: name,fit: fit);
  }else if(name.contains('assets/images')){
   return _imageFromAsset(name,width: width,height: height);
  }
  return Image.asset(
    "assets/images/icons/no_image.png",
    color: AppColors.fontLightGreyColor,
    width: 100,
    height: 100,
    // colorBlendMode: BlendMode.color,
    fit: BoxFit.contain,

  );
}


Widget _imageFromServer({required String imageUrl,fit = BoxFit.cover}){


  return Container(
    color: Colors.grey.shade300,
    child: CachedNetworkImage(
      cacheKey: imageUrl,
      // cacheManager: Cashe,
      imageUrl: imageUrl,

      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => loadingImageWidget,
      errorWidget: (context, url, error) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/no_image.png",
            color: AppColors.fontLightGreyColor,
            width: 100,
            height: 100,
            // colorBlendMode: BlendMode.color,
            fit: BoxFit.contain,

          ),
        ],
      ),
    ),
  );
}

Widget _imageFromAsset(String name,{BoxFit? fit,double? width,double? height}){
  println('-------- image ----- $name');
  return Image.asset(name,fit: fit,width: width,height: height,);
}