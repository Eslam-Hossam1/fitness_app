import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> uploadImageToSupabase(File file) async {
  try {
    final supabase = Supabase.instance.client;

    final user = supabase.auth.currentUser;
    if (user == null) throw Exception('User not logged in');

    //final filePath = '${user.id}/profile.jpg';
    final filePath = '${user.id}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await supabase.storage
        .from('editProfilePic')
        .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

    final imageUrl = supabase.storage
        .from('editProfilePic')
        .getPublicUrl(filePath);

    await supabase.from('editProfilePic').upsert({
      'id': user.id,
      'image_url': imageUrl,
    });

    return imageUrl;
  } catch (e) {
    Fluttertoast.showToast(msg: "Upload error $e");
    print('tttttttttttttttttttttttttttttttttttttttttttttttttttt: $e');
    return null;
  }
}




// Future<String?> uploadImageToSupabase(File file) async {
//   try {
//     final supabase = Supabase.instance.client;

//     final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

//     final filePath = 'editProfilePic/$fileName';

//     await supabase.storage.from('editProfilePic').upload(filePath, file);

//     final imageUrl = supabase.storage
//         .from('editProfilePic')
//         .getPublicUrl(filePath);

//     return imageUrl;
//   } catch (e) {
//     Fluttertoast.showToast(msg: "Upload error$e");
//     return null;
//   }
// }