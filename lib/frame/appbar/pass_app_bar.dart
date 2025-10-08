
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsb_main/frame/button/drawer_button.dart';

class PaassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  // Callbacks for actions
  final VoidCallback? onBack;
  final VoidCallback? onFilter;
  final VoidCallback? onHeart;
  final VoidCallback? onDrawer;

  // Visibility options
  final bool showBack;
  final bool showFilter;
  final bool showHeart;
  final bool showDrawer;

  const PaassAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onFilter,
    this.onHeart,
    this.onDrawer,
    this.showBack = true,
    this.showFilter = false,
    this.showHeart = false,
    this.showDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20 , bottom: 0),
      decoration: const BoxDecoration(
        color: Color(0xFF083F8B),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showDrawer)
            AppDrawerButton(),
            // Title in center
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'FCIconic', // Use your custom font family
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            // Actions on the right
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showFilter)
                  InkWell(
                    onTap: onFilter,
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.transparent,
                        size: 26,
                      ),
                    ),
                  ),
                if (showHeart)
                  InkWell(
                    onTap: onHeart,
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
