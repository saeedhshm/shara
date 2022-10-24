import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shara/helpers/app_colors.dart';
import 'package:shara/helpers/utils/printutils.dart';

import 'loading.dart';

Widget imageFromServer({@required String imageUrl,fit = BoxFit.cover}){

  println('-- image url: $imageUrl');
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