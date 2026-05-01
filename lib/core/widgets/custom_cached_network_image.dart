import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    this.placeHolder,
    this.width,
    this.height,
    this.fit,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  final String url;
  final Widget? placeHolder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? memCacheWidth;
  final int? memCacheHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      imageUrl: url,
      // Adding memCache dimensions significantly improves performance by 
      // resizing the image during decoding to fit the actual display size.
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      placeholder: (context, url) =>
          placeHolder ??
          Container(color: context.cachedNetworkImagePlaceholderColor),
      errorWidget: (context, url, error) =>
          Image.asset(Assets.imagesPngsImagePlaceholder, fit: BoxFit.cover),
    );
  }
}
