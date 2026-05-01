class PlansModel {
  final int id;
  final String name;
  final String description;
  final int durationWeeks;
  final String level;
  final String image;
  final bool isFeatured;
  final double rating;
  final int minutesPerDay;

  factory PlansModel.fromJson(Map<String, dynamic> json) {
    return PlansModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      durationWeeks: json['duration_weeks'],
      level: json['level'],
      image: json['image'],
      isFeatured: json['is_featured'],
    );
  }

  PlansModel({
    required this.id,
    required this.name,
    required this.description,
    required this.durationWeeks,
    required this.level,
    required this.image,
    required this.isFeatured,
    this.rating = 4.8,
    this.minutesPerDay = 45,
  });
}
