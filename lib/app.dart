import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scan_card/blocs/app_settings/app_setting_bloc.dart';
import 'package:scan_card/blocs/app_settings/app_setting_state.dart';
import 'package:scan_card/constants.dart';
import 'package:scan_card/l10n/localization_manager.dart';
import 'package:scan_card/models/language_type.dart';
import 'package:scan_card/models/setting_model.dart';
import 'package:scan_card/pages/home.dart';
import 'package:scan_card/routes/route_name.dart';
import 'package:scan_card/routes/routes.dart';
import 'package:scan_card/theme/theme.dart';

class App extends StatelessWidget {
  final SettingModel settings;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const App({required this.settings});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    LocalizationManager.initialize(navigatorKey);

    return MultiBlocProvider(
      /// List of global bloc
      providers: [
        //BlocProvider(create: (context) => AppSettingBloc(settings)),
        BlocProvider(create: (context) => AppSettingCubit(settings)),
      ],
      /// When app settings changed, rebuild
      child: Provider<FirebaseAnalytics>.value(
        value: analytics,
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (BuildContext context, AppSettingState state) {
            print("settings settings ${state.toString()}");
            return MaterialApp(
              title: APP_NAME,
              initialRoute: RouteName.home,
              home: const Home(),
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics)
              ],
              navigatorKey: navigatorKey,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(state.locale.languageCode),
              theme: AppTheme().light(context),
              darkTheme: AppTheme().dark(context),
              themeMode: state.brightness == Brightness.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              builder: (BuildContext context, Widget? child) =>
                  child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
