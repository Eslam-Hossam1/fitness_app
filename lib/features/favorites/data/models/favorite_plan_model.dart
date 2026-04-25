import 'package:equatable/equatable.dart';

class FavoritePlanModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String duration;
  final String level;
  final String? image;

  const FavoritePlanModel({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.level,
    this.image,
  });

  factory FavoritePlanModel.fromJson(Map<String, dynamic> json) {
    return FavoritePlanModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      level: json['level'] as String? ?? '',
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'level': level,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [id, title, description, duration, level, image];
}
