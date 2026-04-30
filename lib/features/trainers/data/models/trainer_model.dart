class TrainerModel {
  final int id;
  final String name;
  final String specialty;
  final int experienceYears;
  final double rating;
  final String image;
  final int clientsCount;

  const TrainerModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.rating,
    required this.image,
    required this.clientsCount,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      id: json['id'] as int,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      experienceYears: json['experience_years'] as int,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      clientsCount: json['clients_count'] ?? (100 + (json['id'] as int) * 5),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'experience_years': experienceYears,
      'rating': rating,
      'image': image,
    };
  }
}
