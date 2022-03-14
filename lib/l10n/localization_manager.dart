import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationManager {
  static late GlobalKey<NavigatorState> _navigatorKey;

  static AppLocalizations get localizations {
    return AppLocalizations.of(_navigatorKey.currentContext!)!;
  }

  static void initialize(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  LocalizationManager._();
}
