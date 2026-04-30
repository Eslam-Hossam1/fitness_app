import 'package:flutter/material.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';

class PlanImage extends StatelessWidget {
  const PlanImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = 120.w(context);
    final height = 140.h(context);
    
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r(context)),
        bottomLeft: Radius.circular(16.r(context)),
      ),
      child: CustomCachedNetworkImage(
        url: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        // Memory optimization: decode image only at the size it's displayed
        memCacheWidth: width.toInt(),
        memCacheHeight: height.toInt(),
      ),
    );
  }
}
