import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final SupabaseClient client = Supabase.instance.client;

  Map<String, String> getUserData() {
    final user = client.auth.currentUser;

    return {
      "name": user?.userMetadata?['name'] ?? '',
      "email": user?.email ?? '',
    };
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }
}