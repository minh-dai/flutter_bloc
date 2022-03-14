import 'package:flutter/material.dart';
import 'package:scan_card/models/language_type.dart';

class SettingModel {
  Brightness brightness;
  LanguageType locale;

  SettingModel({
    required this.brightness,
    required this.locale,
  });
}
