import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

Widget _imageFromServer({required String imageUrl,fit = BoxFit.contain}){


  return CachedNetworkImage(
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
    errorWidget: (context, url, error) => Image.asset(
      "assets/images/icons/no_image.png",
      color: Colors.grey.shade300,
      // colorBlendMode: BlendMode.clear,
      fit: BoxFit.contain,

    ),
  );
}