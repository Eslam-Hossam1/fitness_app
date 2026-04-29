import 'profile_service.dart';

class ProfileController {
  final ProfileService service;

  ProfileController(this.service);

  String name = '';
  String email = '';

  void loadUser() {
    final data = service.getUserData();
    name = data['name']!;
    email = data['email']!;
  }

  Future<void> logout() async {
    await service.logout();
  }
}