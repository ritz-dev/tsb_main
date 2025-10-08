import 'package:flutter/material.dart';
import 'package:tsb_main/frame/button/language_button.dart';
import 'package:tsb_main/frame/navigation/bottom_navigation_frame.dart';
import 'package:tsb_main/utils/localization/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 3; // for bottom nav if you later add it

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF0A4DA2), // blue background
      // appBar: CreditHomeAppBar(
      //   title: AppLocalizations.of(context)!.translate('settings'),
      //   enableBack: false,
      // ),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('settings'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Color(0xFF0A4DA2),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.translate('change_language'),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const LanguageButton(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Notifications Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Color(0xFF0A4DA2),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.translate('notifications'),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                      activeThumbColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Privacy Section
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.lock, color: Color(0xFF0A4DA2)),
                    title: Text(
                      AppLocalizations.of(context)!.translate('privacy'),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      // TODO: Navigate to privacy page
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationFrame(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
