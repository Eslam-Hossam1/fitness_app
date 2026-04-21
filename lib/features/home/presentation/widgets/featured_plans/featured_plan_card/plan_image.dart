import 'package:flutter/material.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';

class PlanImage extends StatelessWidget {
  const PlanImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: CustomCachedNetworkImage(
        url: imageUrl,
        width: 120.w(context),
        height: 140.h(context),
        fit: BoxFit.cover,
      ),
    );
  }
}
