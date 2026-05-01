class ProfileModel {
  final String id;
  final String name;
  final String email;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
}