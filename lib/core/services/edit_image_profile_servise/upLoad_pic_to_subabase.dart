import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> uploadImageToSupabase(File file) async {
  try {
    final supabase = Supabase.instance.client;

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    final filePath = 'editProfilePic/$fileName';

    await supabase.storage.from('editProfilePic').upload(filePath, file);

    final imageUrl = supabase.storage
        .from('editProfilePic')
        .getPublicUrl(filePath);

    return imageUrl;
  } catch (e) {
    Fluttertoast.showToast(msg: "Upload error$e");
    return null;
  }
}
