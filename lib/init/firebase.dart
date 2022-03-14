import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:scan_card/constants.dart';

Future initFirebase() async {

  FirebaseOptions  firebaseOptions = const FirebaseOptions(
    appId: '1:448618578101:ios:0b650370bb29e29cac3efc',
    apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
    projectId: 'react-native-firebase-testing',
    messagingSenderId: '448618578101',
  );

  await Firebase.initializeApp(options: firebaseOptions,);

  if (CRASHLYTICS_TEST_MODE) {
    // Force enable crashlytics collection enabled if we're testing it.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    // Else only enable it in non-debug builds.
    // You could additionally extend this to allow users to opt-in.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  // Pass all uncaught errors to Crashlytics.
  Function originalOnError = FlutterError.onError as Function;
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    originalOnError(errorDetails);
  };
}
