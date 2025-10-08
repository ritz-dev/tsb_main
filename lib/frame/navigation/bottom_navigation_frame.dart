import 'package:flutter/material.dart';
import 'package:tsb_main/package_mode.dart';
import 'package:tsb_main/screen/pass_main.dart';
import 'package:tsb_main/screen/setting_page.dart';
import 'package:tsb_main/theme/color_theme.dart';
import 'package:tsb_main/utils/localization/app_localizations.dart';
import 'package:tsb_mini/screen/home/home_page.dart';


class BottomNavigationFrame extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final AppLocalizations? localize;

  const BottomNavigationFrame({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.localize,
  });

  void _handleNavigation(BuildContext context, int index) {
    onItemTapped(index);

    // page navigation switch
    switch (index) {
      case 0:
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => CarbonPassingPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => CarbonPassingPage()),
        );
        break;
     case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                RewardPage(localize: localize ?? AppLocalizations.of(context)!),
          ),
        );
        break;
      case 3:
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SettingsPage()),
        );
        break;
    }
  }

  Widget _buildNavItem(
    BuildContext context,
    String label,
    String iconPath,
    int index,
  ) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => _handleNavigation(context, index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF083f8c) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PackageAssets.image(
              iconPath,
              color: isSelected ? Colors.white : Colors.black,
            ),
            // ImageIcon(
            //   AssetImage(iconPath),
            //   size: 28,
            //   color: isSelected ? Colors.white : Colors.black,
            // ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: MainAppColors.mainAppBottomNav,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildNavItem(
              context,
              'TRANSPORT',
              'assets/bottom_image/vector.png',
              0,
            ),
          ),
          Expanded(
            child: _buildNavItem(
              context,
              'PASS',
              'assets/bottom_image/ticket.png',
              1,
            ),
          ),
          Expanded(
            child: _buildNavItem(
              context,
              'REWARD',
              'assets/bottom_image/reward.png',
              2,
            ),
          ),
          Expanded(
            child: _buildNavItem(
              context,
              'SETTING',
              'assets/bottom_image/setting.png',
              3,
            ),
          ),
        ],
      ),
    );
  }
}
