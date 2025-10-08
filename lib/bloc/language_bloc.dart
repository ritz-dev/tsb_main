import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tsb_main/bloc/language_event.dart';
import 'package:tsb_main/bloc/language_state.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(locale: 'en')) {
    on<LanguageEvent>((event, emit) {
      on<ChangeLanguageEvent>(_onChangeLanguage);
    _loadSavedLocale();
    });
  }

  Future<String> _getSettingsFilePath() async {
    final directory =
        await getExternalStorageDirectory(); // Shared directory for Android
        debugPrint(directory?.path);
    return '${directory!.path}/app_settings.json'; // Cross-app accessible file
  }

  void _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageState(locale: event.locale));
    try {
      final filePath = await _getSettingsFilePath();
      final file = File(filePath);
      final settings = {'locale': event.locale};
      await file.writeAsString(jsonEncode(settings));
    } catch (e) {
      // Fallback to shared_preferences if file access fails
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', event.locale);
    }
  }

  void _loadSavedLocale() async {
    try {
      final filePath = await _getSettingsFilePath();
      final file = File(filePath);
      if (await file.exists()) {
        final contents = await file.readAsString();
        final settings = jsonDecode(contents);
        final savedLocale = settings['locale'];
        if (savedLocale != null) {
          add(ChangeLanguageEvent(savedLocale));
          return;
        }
      }
    } catch (e) {
      // Fallback to shared_preferences
    }
    // Fallback
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale');
    if (savedLocale != null) {
      add(ChangeLanguageEvent(savedLocale));
    }
  }
}
