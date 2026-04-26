import 'dart:io';
import 'package:fitness_app/core/services/edit_image_profile_servise/upLoad_pic_to_subabase.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePic extends StatefulWidget {
  const EditProfilePic({super.key});

  @override
  State<EditProfilePic> createState() => _EditProfilePicState();
}

class _EditProfilePicState extends State<EditProfilePic> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Stack(
        children: [
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final avatarRadius = constraints.maxWidth * 0.26;
                final iconSize = constraints.maxWidth * 0.07;
                final iconRadius = constraints.maxWidth * 0.06;
                return Stack(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: AppColors.darkOutline,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : AssetImage(Assets.imagesPngsProfilePicture)
                                as ImageProvider,
                    ),
                    Positioned(
                      bottom: constraints.maxWidth * 0.02,
                      right: constraints.maxWidth * 0.02,
                      child: InkWell(
                        onTap: () async {
                          selectedImage = await pickImageFromGallery();
                          setState(() {});

                          if (selectedImage != null) {
                            final url = await uploadImageToSupabase(
                              selectedImage!,
                            );
                          }
                        },
                        child: CircleAvatar(
                          radius: iconRadius,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.camera_alt,
                            size: iconSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<File?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return null;
  return File(pickedFile.path);
}
