import 'dart:async';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scan_card/app.dart';
import 'package:scan_card/init/firebase.dart';
import 'package:scan_card/init/flutter.dart';
import 'package:scan_card/init/settings.dart';

/// Init app
Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initRotation();
  await initFirebase();
}

void main() async {
  runZonedGuarded(() async {
    await init();
    /// Splash screen appear until runApp is launched
    runApp(App(settings: await loadSettings()));
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('runZonedGuarded: Caught error in my root zone.');
    }
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}