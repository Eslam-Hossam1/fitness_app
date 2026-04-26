import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/utils/assets.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      // Re-tap on the active branch pops back to its initial route
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(
              color: context.secondaryTextColor.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: context.primaryColor,
          unselectedItemColor: context.secondaryTextColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: _NavBarIcon(
                iconPath: Assets.imagesSvgsHome,
                isSelected: navigationShell.currentIndex == 0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _NavBarIcon(
                iconPath: Assets.imagesSvgsPerson,
                isSelected: navigationShell.currentIndex == 1,
              ),
              label: 'Trainers',
            ),
            BottomNavigationBarItem(
              icon: _NavBarIcon(
                iconPath: Assets.imagesSvgsPlans,
                isSelected: navigationShell.currentIndex == 2,
              ),
              label: 'Plans',
            ),
            BottomNavigationBarItem(
              icon: _NavBarIcon(
                iconPath: Assets.imagesSvgsHeart,
                isSelected: navigationShell.currentIndex == 3,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _NavBarIcon(
                iconPath: Assets.imagesSvgsProfile,
                isSelected: navigationShell.currentIndex == 4,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  const _NavBarIcon({required this.iconPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? context.primaryColor : context.secondaryTextColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
