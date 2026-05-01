import 'package:fitness_app/features/profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  final String? initialImageUrl;
  const EditProfileView({super.key, this.initialImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: EditProfileViewBody(initialImageUrl: initialImageUrl),
    );
  }
}
