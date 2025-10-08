import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsb_main/bloc/language_bloc.dart';
import 'package:tsb_main/bloc/language_event.dart';
import 'package:tsb_main/bloc/language_state.dart';
import 'package:tsb_main/utils/localization/app_localizations.dart';

class LanguageButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LanguageButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final isEnglish = state.locale == 'en';
        return ElevatedButton.icon(
          icon: Icon(Icons.language),
          label: Text(
            isEnglish
                ? '${AppLocalizations.of(context)!.translate('change_language')} (ไทย)'
                : '${AppLocalizations.of(context)!.translate('change_language')} (EN)',
          ),
          onPressed: () {
            final newLocale = isEnglish ? 'th' : 'en';
            context.read<LanguageBloc>().add(ChangeLanguageEvent(newLocale));
          },
        );
      },
    );
  }
}

