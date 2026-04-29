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
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String originalName = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              EditProfilePic(),
              Text(
                'Change Profile Picture',
                style: AppTextStyles.medium14(
                  context,
                ).copyWith(color: AppColors.darkPrimary),
              ),
              SizedBox(height: 40),
              CustomTextFormFieldWithTitle(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
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
                  await nameUpdateCheck(context);
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

  Future<void> nameUpdateCheck(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final success = await updateDisplayName();

      if (success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Name updated successfully ✅")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Something went wrong ❌")));
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
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
