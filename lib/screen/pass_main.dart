import 'package:flutter/material.dart';
import 'package:tsb_main/frame/appbar/pass_app_bar.dart';
import 'package:tsb_main/frame/body/grid_view_frame.dart';
import 'package:tsb_main/frame/body/pass_hero_card.dart';
import 'package:tsb_main/frame/body/pass_hero_text_bar.dart';
import 'package:tsb_main/frame/navigation/bottom_navigation_frame.dart';
import 'package:tsb_main/utils/localization/app_localizations.dart';

class CarbonPassingPage extends StatefulWidget {
  final AppLocalizations? localize;

  const CarbonPassingPage({super.key, this.localize});

  @override
  _CarbonPassingPageState createState() => _CarbonPassingPageState();
}

class _CarbonPassingPageState extends State<CarbonPassingPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use passed localize if available, otherwise fallback
    final localize = widget.localize ?? AppLocalizations.of(context)!;

    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.account_balance_wallet,
        'title': localize.translate('top_up'),
      },

      {'icon': Icons.rotate_left, 
      'title': localize.translate('usage_history')
      },

      {'icon': Icons.card_giftcard, 
      'title': localize.translate('privileges')
      },
      
      {
        'icon': Icons.mobile_screen_share_sharp,
        'title': localize.translate('update_balance'),
      },

      {'icon': Icons.help_outline, 
       'title': localize.translate('how_to_use')
      },
      
      {
        'icon': Icons.error_outline,
        'title': localize.translate('report_problem'),
      },
    ];

    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;
    final screenWidth = media.size.width;

    final heroCardHeight = screenHeight * 0.28;
    final topSpacing = screenHeight * 0.03;

    return Scaffold(
      backgroundColor: const Color(0xFF083F8B),
      appBar: PaassAppBar(
        title: localize.translate('pass'),
        showDrawer: true,
        showFilter: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PassHeroTextBar(
            currentPassCount: 1,
            totalPassCount: 2,
            onExpiredPassTap: () {},
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: screenWidth * 0.7,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                PassHeroCard(
                  imagePaths: [
                    'assets/image/hop2.png',
                    'assets/image/hop2.png',
                    'assets/image/hop2.png',
                    'assets/image/hop.png',
                  ],
                  cardWidth: screenWidth,
                  cardHeight: heroCardHeight,
                ),
              ],
            ),
          ),
          SizedBox(height: topSpacing),
          Expanded(
            child: GridViewFrame(
              items: items,
              maxWidth: screenWidth * 0.95,
              crossAxisCount: screenWidth < 400 ? 3 : 3,
              spacing: screenWidth * 0.03,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationFrame(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        localize: localize, // Pass localization to bottom nav
      ),
    );
  }
}
