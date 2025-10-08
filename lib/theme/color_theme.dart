import 'package:flutter/material.dart';
// Main Frame App color theme
class MainAppColors{    
    
  static const Color mainAppBackground = Color(0xFF083F8B); 
  static const Color mainAppBottomNav = Color(0xFFEEF7FF);

}

/// App color theme (centralized colors for the whole app)

class AppColors {
  // Background colors
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF); // Card
  static const Color badgeCardBackground = Color(0xFF323236); // Badge Card
  static const Color bottomApproveBackground = Color(0xFF2E3192); // Bottom Approve

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF4F4F4F);
  static const Color textdarkblack = Color(0xff323236);
  static const Color textLight = Color(0xFFACACAC);
  static const Color textLightGrey = Color(0xFF606060);
  static const Color textWhite = Colors.white;
  static const Color textBlack = Color(0xFF000000);
  static const Color textGrey = Color(0xff83848B);
  static const Color textgreen = Color(0xff05976A);
  static const Color textRed = Color(0xffEB5757);
  static const Color textBluePoint = Color(0xff2E3192);
  static const Color textGreenPoint = Color(0xff05916A);
  static const Color textSeemore = Color(0xFF2E3192);

  // Border , ivider and progress bar colors
  static const Color listcardborder = Color(0xFFE6E5E5);
  static const Color divider = Color(0xFFD9D9D9);
  static const Color progressBar = Color(0xFF2E3192);

  // Icon colors
  static const Color iconAppbar = Color(0xff606060);
  static const Color iconBottomNav = Color(0xff606060);
  static const Color iconBottomNavActive = Color(0xffE6E5E5);
  static const Color iconHeart = Color(0xFF2E3192);

  // Status colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF2C94C);
  static const Color error = Color(0xFFEB5757);

  // Transparent & shadow
  static const Color transparent = Colors.transparent;
  static const Color shadow = Color(0x1A000000); // 10% black shadow
}
