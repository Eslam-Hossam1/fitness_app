import 'package:supabase_flutter/supabase_flutter.dart';

Stream<String?> getProfileImageStream(String userId) {
  return Supabase.instance.client
      .from('editProfilePic')
      .stream(primaryKey: ['id'])
      .eq('id', userId)
      .map((data) {
        if (data.isEmpty) return null;
        return data.first['image_url'] as String?;
      });
}

// Future<String> getProfileImage() async {
//   final supabase = Supabase.instance.client;
//   final user = supabase.auth.currentUser;
//   if (user == null) return 'assets/images/svgs/profile.svg';

//   final response = await supabase
//       .from('editProfilePic')
//       .select('image_url')
//       .eq('id', user.id)
//       .maybeSingle();
//   return response?['image_url'] ?? 'assets/images/svgs/profile.svg';
// }
