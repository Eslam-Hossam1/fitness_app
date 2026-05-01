import 'featured_plan_step.dart';

class FeaturedPlan {
  final int id;
  final String name;
  final String description;
  final int durationWeeks;
  final String level;
  final String image;
  final bool isFeatured;
  final List<FeaturedPlanStep> steps;

  FeaturedPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.durationWeeks,
    required this.level,
    required this.image,
    required this.isFeatured,
    required this.steps,
  });

  factory FeaturedPlan.fromJson(Map<String, dynamic> json) => FeaturedPlan(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    durationWeeks: json['duration_weeks'],
    level: json['level'],
    image: json['image'],
    isFeatured: json['is_featured'] ?? false,
    steps: (json['steps'] as List).map((s) => FeaturedPlanStep.fromJson(s)).toList(),
  );
}
