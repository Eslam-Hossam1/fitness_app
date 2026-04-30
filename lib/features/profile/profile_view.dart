import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/services/edit_image_profile_servise/get_image_url.dart';
import 'package:fitness_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_controller.dart';
import 'package:fitness_app/core/widgets/buttons/custom_button.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = GetIt.instance<ProfileController>();
  final user = Supabase.instance.client.auth.currentUser;
  String? currentImageUrl;

  @override
  void initState() {
    super.initState();
    controller.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B121A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Profile",
          style: AppTextStyles.bold22(context, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w(context)),
            child: const Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Column(
          children: [
            SizedBox(height: 20.h(context)),
            Column(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // profile image from supabase;
                      StreamBuilder<String?>(
                        stream: getProfileImageStream(user!.id),
                        builder: (context, snapshot) {
                          currentImageUrl = snapshot.data;
                          controller.loadUser();
                          final imageUrl = snapshot.data;
                          
                          final double size = 120.r(context);

                          // While waiting for the stream, show a consistent background 
                          // to avoid flickering to the default image.
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Container(
                              width: size,
                              height: size,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff151F29),
                              ),
                            );
                          }

                          return Container(
                            width: size,
                            height: size,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff151F29),
                            ),
                            child: ClipOval(
                              child: imageUrl == null
                                  ? Image.asset(
                                      Assets.imagesPngsDefaultProfile,
                                      fit: BoxFit.cover,
                                    )
                                  : CustomCachedNetworkImage(
                                      url: imageUrl,
                                      fit: BoxFit.cover,
                                      // Reverted memCache settings as per user request
                                    ),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 30.r(context),
                        width: 30.r(context),
                        decoration: const BoxDecoration(
                          color: Color(0xff1877F2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 16.r(context),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h(context)),
                Text(
                  controller.name,
                  style: AppTextStyles.bold22(context, color: Colors.white),
                ),
              ],
            ),

            Text(
              controller.email,
              style: AppTextStyles.regular14(context, color: Colors.grey.shade500),
            ),
            SizedBox(height: 20.h(context)),
            CustomButton(
              width: 160.w(context),
              height: 56.h(context),
              backgroundColor: const Color(0xff1877F2),
              borderRadius: 10,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileView(
                      initialImageUrl: currentImageUrl,
                    ),
                  ),
                );
                if (mounted) {
                  setState(() {
                    controller.loadUser();
                  });
                }
              },
              child: Text(
                "Edit Profile",
                style: AppTextStyles.bold16(context, color: Colors.white),
              ),
            ),
            SizedBox(height: 30.h(context)),
            Row(
              children: [
                _card("Plans\nCompleted", "5", Icons.check_circle_outline, context),
                SizedBox(width: 15.w(context)),
                _card("Workout\nHours", "120", Icons.timer_outlined, context),
              ],
            ),
            SizedBox(height: 30.h(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account Settings",
                style: AppTextStyles.bold18(context, color: Colors.white),
              ),
            ),
            SizedBox(height: 15.h(context)),
            _buildSettingItem(
              context: context,
              icon: Icons.notifications_none_outlined,
              title: "Notifications",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              context: context,
              icon: Icons.security_outlined,
              title: "Privacy & Security",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              context: context,
              icon: Icons.language,
              title: "Language",
              trailing: "English",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              context: context,
              icon: Icons.logout,
              title: "Sign Out",
              onTap: () async {
                await controller.logout();
                if (context.mounted) {
                  context.go(RoutePaths.login);
                }
              },
              iconColor: Colors.red.shade400,
              isExit: true,
            ),
            SizedBox(height: 30.h(context)),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value, IconData icon, BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.r(context)),
        decoration: BoxDecoration(
          color: const Color(0xff151F29),
          borderRadius: BorderRadius.circular(12.r(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xff1877F2), size: 22.r(context)),
            SizedBox(height: 12.h(context)),
            Text(
              title,
              style: AppTextStyles.medium13(context, color: Colors.grey.shade400).copyWith(height: 1.2),
            ),
            SizedBox(height: 8.h(context)),
            Text(
              value,
              style: AppTextStyles.bold24(context, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? trailing,
    VoidCallback? onTap,
    required Color iconColor,
    bool isExit = false,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Container(
        padding: EdgeInsets.all(8.r(context)),
        decoration: BoxDecoration(
          color: const Color(0xff151F29),
          borderRadius: BorderRadius.circular(10.r(context)),
        ),
        child: Icon(icon, color: iconColor, size: 22.r(context)),
      ),
      title: Text(
        title,
        style: AppTextStyles.regular16(context, color: isExit ? Colors.red.shade400 : Colors.white),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(trailing, style: AppTextStyles.regular14(context, color: Colors.grey)),
          SizedBox(width: 8.w(context)),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        ],
      ),
    );
  }
}
