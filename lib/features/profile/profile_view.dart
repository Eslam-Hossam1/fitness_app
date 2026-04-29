import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'profile_controller.dart';
import 'package:fitness_app/core/widgets/buttons/custom_button.dart';
import 'package:lib/features/profile/presentation/views/edit_profile_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = GetIt.instance<ProfileController>();

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
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff151F29),
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/images/svgs/profile.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xff1877F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              controller.name,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.email,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),
            const SizedBox(height: 20),
            CustomButton(
              width: 160,
              height: 45,
              backgroundColor: const Color(0xff1877F2),
              borderRadius: 10,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileView(),
                  ),
                );
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                _card("Plans\nCompleted", "5", Icons.check_circle_outline),
                const SizedBox(width: 15),
                _card("Workout\nHours", "120", Icons.timer_outlined),
              ],
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            _buildSettingItem(
              icon: Icons.notifications_none_outlined,
              title: "Notifications",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              icon: Icons.security_outlined,
              title: "Privacy & Security",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              icon: Icons.language,
              title: "Language",
              trailing: "English",
              iconColor: Colors.blue.shade400,
            ),
            _buildSettingItem(
              icon: Icons.logout,
              title: "Sign Out",
              onTap: () async => await controller.logout(),
              iconColor: Colors.red.shade400,
              isExit: true,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff151F29),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xff1877F2), size: 22),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey.shade400, fontSize: 13, height: 1.2),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xff151F29),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isExit ? Colors.red.shade400 : Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(trailing, style: const TextStyle(color: Colors.grey)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        ],
      ),
    );
  }
}