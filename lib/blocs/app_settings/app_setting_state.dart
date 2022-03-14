import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scan_card/models/language_type.dart';

class AppSettingState extends Equatable {
  Brightness brightness;
  LanguageType locale;

  AppSettingState({
    required this.brightness,
    required this.locale,
  });

  AppSettingState copyWith({
    Brightness? brightness,
    LanguageType? locale,
  }) =>
      AppSettingState(
        brightness: brightness ?? this.brightness,
        locale: locale ?? this.locale,
      );

  @override
  List<Object> get props => [brightness, locale];

  @override
  String toString() {
    return 'AppSettingState{brightness: $brightness, locale: $locale}';
  }
}
