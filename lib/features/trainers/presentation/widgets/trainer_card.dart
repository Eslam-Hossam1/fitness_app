import 'package:flutter/material.dart';
import 'package:fitness_app/features/trainers/data/models/trainer_model.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w(context), vertical: 8.h(context)),
      padding: EdgeInsets.all(16.r(context)),
      decoration: BoxDecoration(
        color: const Color(0xff151F29),
        borderRadius: BorderRadius.circular(16.r(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Trainer Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r(context)),
            child: CustomCachedNetworkImage(
              url: trainer.image,
              width: 100.w(context),
              height: 100.h(context),
              fit: BoxFit.cover,
              // Optimize by matching cache size to display size
              memCacheWidth: 100.w(context).toInt(),
              memCacheHeight: 100.h(context).toInt(),
            ),
          ),
          SizedBox(width: 16.w(context)),
          // Trainer Info Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        trainer.name,
                        style: AppTextStyles.bold18(context, color: Colors.white),
                      ),
                    ),
                    // Rating Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w(context), vertical: 4.h(context)),
                      decoration: BoxDecoration(
                        color: const Color(0xff1A2D3A),
                        borderRadius: BorderRadius.circular(6.r(context)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color(0xff1877F2), size: 14),
                          SizedBox(width: 4.w(context)),
                          Text(
                            trainer.rating.toString(),
                            style: AppTextStyles.bold12(context, color: const Color(0xff1877F2)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h(context)),
                Text(
                  trainer.specialty,
                  style: AppTextStyles.medium14(context, color: const Color(0xff1877F2)),
                ),
                SizedBox(height: 8.h(context)),
                // Stats
                Row(
                  children: [
                    const Icon(Icons.history, color: Colors.grey, size: 14),
                    SizedBox(width: 4.w(context)),
                    Text(
                      '${trainer.experienceYears} yrs exp',
                      style: AppTextStyles.regular12(context, color: Colors.grey),
                    ),
                    SizedBox(width: 12.w(context)),
                    const Icon(Icons.people_outline, color: Colors.grey, size: 14),
                    SizedBox(width: 4.w(context)),
                    Text(
                      '${trainer.clientsCount}+ clients',
                      style: AppTextStyles.regular12(context, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                // View Profile Button
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w(context), vertical: 8.h(context)),
                  decoration: BoxDecoration(
                    color: const Color(0xff2A3540),
                    borderRadius: BorderRadius.circular(10.r(context)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Profile',
                        style: AppTextStyles.bold13(context, color: Colors.white),
                      ),
                      SizedBox(width: 6.w(context)),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
