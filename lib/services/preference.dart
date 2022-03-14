import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scan_card/models/language_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future setThemeMode(Brightness brightness) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt("brightness", brightness.index);
  }

  Future<Brightness> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt("brightness") ??
        SchedulerBinding.instance!.window.platformBrightness.index;

    return Brightness.values[index];
  }

  Future setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString("locale", locale);
  }

  Future<LanguageType> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("locale") == LanguageType.vietnamese.languageCode) {
      return LanguageType.vietnamese;
    }
    return LanguageType.english;
  }
}
