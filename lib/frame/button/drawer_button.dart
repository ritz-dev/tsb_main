import 'package:flutter/material.dart';
import 'package:tsb_main/theme/icon_theme.dart';

class AppDrawerButton extends StatelessWidget {
  final VoidCallback? onDrawer;

  const AppDrawerButton({super.key, this.onDrawer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onDrawer ?? () => Navigator.of(context).pop(),
      borderRadius: BorderRadius.circular(50), // Makes InkWell ripple circular
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF051F3C).withOpacity(0.2), // Background color
          shape: BoxShape.circle, // Circular background
        ),
        padding: const EdgeInsets.all(12), // Padding for icon inside circle
        child: AppIcons.drawerSvgIcon(
          size: 18 ,
          color: Color(0XFFFFFFFF)), // Your custom SVG icon
      ),
    );
  }
}
