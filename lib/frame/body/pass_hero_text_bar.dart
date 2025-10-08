import 'package:flutter/material.dart';
import 'package:tsb_main/utils/localization/app_localizations.dart';

class PassHeroTextBar extends StatelessWidget {
  final int currentPassCount;
  final int totalPassCount;
  final VoidCallback onExpiredPassTap;

  const PassHeroTextBar({
    super.key,
    required this.currentPassCount,
    required this.totalPassCount,
    required this.onExpiredPassTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final localize = AppLocalizations.of(context);

    // Clamp the font size so it doesn't grow too large
    final titleFontSize = screenWidth * 0.08 > 24 ? 24.0 : screenWidth * 0.08;
    final expiredFontSize = screenWidth * 0.045 > 18 ? 18.0 : screenWidth * 0.045;

    return Container(
      color: const Color(0xFF083F8B),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.04,
      ),
      child: Row(
        children: [
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${localize?.translate('your_pass') ?? 'Pass ของคุณ'} ',
                    style: TextStyle(
                      fontFamily: 'FCIconic',
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '($currentPassCount/$totalPassCount)',
                    style: TextStyle(
                      fontFamily: 'FCIconic',
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onExpiredPassTap,
            child: Text(
              '${localize?.translate('expired_pass') ?? 'Expired Pass'} →',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'FCIconic',
                color: Colors.white.withOpacity(0.8),
                fontSize: expiredFontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

