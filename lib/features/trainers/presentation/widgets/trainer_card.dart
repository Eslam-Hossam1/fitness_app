import 'package:flutter/material.dart';
import 'package:fitness_app/features/trainers/data/models/trainer_model.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff151F29), // Darker card background from image
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center the info relative to image
        children: [
          // Trainer Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomCachedNetworkImage(
              url: trainer.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Rating Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xff1A2D3A),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color(0xff1877F2), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            trainer.rating.toString(),
                            style: const TextStyle(
                              color: Color(0xff1877F2),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  trainer.specialty,
                  style: const TextStyle(
                    color: Color(0xff1877F2),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Stats
                Row(
                  children: [
                    const Icon(Icons.history, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${trainer.experienceYears} yrs exp',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.people_outline, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${trainer.clientsCount}+ clients',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // View Profile Button (Now inside the info column, under exp)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xff2A3540),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
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
