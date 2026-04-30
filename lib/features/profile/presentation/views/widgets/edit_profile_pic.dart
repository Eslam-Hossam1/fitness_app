import 'dart:io';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePic extends StatelessWidget {
  final File? selectedImage;
  final String? initialImageUrl;
  final ValueChanged<File?> onImageSelected;

  const EditProfilePic({
    super.key,
    required this.selectedImage,
    this.initialImageUrl,
    required this.onImageSelected,
  });

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
                    Container(
                      width: avatarRadius * 2,
                      height: avatarRadius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.darkOutline,
                        border: Border.all(color: AppColors.darkOutline, width: 2),
                      ),
                      child: ClipOval(
                        child: _buildImage(),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () async {
                          final image = await pickImageFromGallery();
                          onImageSelected(image);
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

  Widget _buildImage() {
    if (selectedImage != null) {
      return Image.file(selectedImage!, fit: BoxFit.cover);
    }
    if (initialImageUrl != null) {
      return CustomCachedNetworkImage(
        url: initialImageUrl!,
        fit: BoxFit.cover,
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Image.asset(
      Assets.imagesPngsDefaultProfile,
      fit: BoxFit.cover,
    );
  }
}

Future<File?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return null;
  return File(pickedFile.path);
}
