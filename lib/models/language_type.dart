import 'package:scan_card/l10n/localization_manager.dart';

enum LanguageType {
  english,
  vietnamese,
}

extension LanguageTypeExtension on LanguageType {
  String get languageCode {
    switch (this) {
      case LanguageType.english:
        return 'en';
      case LanguageType.vietnamese:
        return 'vi';
    }
  }

  String get displayName {
    switch (this) {
      case LanguageType.english:
        return 'English';
      case LanguageType.vietnamese:
        return 'Tiếng Việt';
    }
  }

  String get translatedName {
    switch (this) {
      case LanguageType.english:
        return LocalizationManager.localizations.english;
      case LanguageType.vietnamese:
        return LocalizationManager.localizations.vietnamese;
    }
  }

  String get apiCountryCode {
    switch (this) {
      case LanguageType.english:
        return 'EN';
      case LanguageType.vietnamese:
        return 'VN';
    }
  }

  static LanguageType parseLanguageCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return LanguageType.english;
      case 'vi':
        return LanguageType.vietnamese;
      default:
        return LanguageType.english;
    }
  }
}
