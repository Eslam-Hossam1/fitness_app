import 'dart:io';
import 'package:fitness_app/core/services/edit_image_profile_servise/upLoad_pic_to_subabase.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/widgets/buttons/custom_button.dart';
import 'package:fitness_app/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:fitness_app/features/profile/presentation/views/widgets/account_verification_box.dart';
import 'package:fitness_app/features/profile/presentation/views/widgets/edit_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String originalName = "";
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              EditProfilePic(
                selectedImage: selectedImage,
                onImageSelected: (File? image) {
                  setState(() => selectedImage = image);
                },
              ),
              Text(
                'Change Profile Picture',
                style: AppTextStyles.medium14(
                  context,
                ).copyWith(color: AppColors.darkPrimary),
              ),
              SizedBox(height: 40),
              CustomTextFormFieldWithTitle(
                controller: nameController,
                title: 'Full Name',
                hint: 'Enter your name please',
                titleStyle: AppTextStyles.medium14(
                  context,
                ).copyWith(color: AppColors.darkSecondaryTextColor),
              ),
              SizedBox(height: 40),
              AccountVerificationBox(),
              SizedBox(height: 16),
              CustomButton(
                width: double.infinity,
                onPressed: () async {
                  await upDateName(context);

                  await upDateProfilePic(context);
                  setState(() {});
                },
                child: Text(
                  'Save Changes',
                  style: AppTextStyles.semiBold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 12),
              CustomButton(
                backgroundColor: AppColors.darkFormColor,
                width: double.infinity,
                onPressed: () {
                  nameController.text = originalName;
                  FocusScope.of(context).unfocus();
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: Text(
                  'Cancel Changes',
                  style: AppTextStyles.semiBold16(
                    context,
                  ).copyWith(color: AppColors.darkSecondaryTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> upDateProfilePic(BuildContext context) async {
    try {
      if (selectedImage != null) {
        await uploadImageToSupabase(selectedImage!);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile picture updated successfully ✅")),
        );
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong ❌")));
    }
  }

  Future<void> upDateName(BuildContext context) async {
    try {
      if (originalName != nameController.text.trim()) {
        await updateDisplayName();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Name updated successfully ✅")));
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong ❌")));
    }
  }

  Future<bool> updateDisplayName() async {
    try {
      final supabase = Supabase.instance.client;

      final name = nameController.text.trim();

      await supabase.auth.updateUser(
        UserAttributes(data: {'display_name': name}),
      );

      //  getting name from suupaBase;

      final user = Supabase.instance.client.auth.currentUser;

      final displayName = user?.userMetadata?['display_name'];

      return true;
    } catch (e) {
      return false;
    }
  }
}
