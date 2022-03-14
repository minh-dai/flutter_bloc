import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scan_card/blocs/app_settings/app_setting_event.dart';
import 'package:scan_card/blocs/app_settings/app_setting_state.dart';
import 'package:scan_card/models/language_type.dart';
import 'package:scan_card/models/setting_model.dart';
import 'package:scan_card/services/preference.dart';

// class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
//   AppSettingBloc(SettingModel settingModel)
//       : super(AppSettingState(
//           brightness: settingModel.brightness,
//           locale: settingModel.locale,
//         )) {
//     on<ChangeLocale>(changeLocaleUpdate);
//     on<ChangeTheme>(changeThemeUpdate);
//   }
//
//   Stream<void> changeLocaleUpdate(event, emit) async* {
//     String lang = state.locale == "en" ? "vi" : "en";
//     print('changeLocaleUpdate $lang');
//     await PreferenceService().setLocale(lang);
//     yield state.copyWith(locale: lang);
//   }
//
//   Stream<void> changeThemeUpdate(event, emit) async* {
//     final brightness = state.brightness == Brightness.dark
//         ? Brightness.light
//         : Brightness.dark;
//     await PreferenceService().setThemeMode(brightness);
//     yield state.copyWith(brightness: brightness);
//   }
// }

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit(SettingModel settingModel)
      : super(AppSettingState(
          brightness: settingModel.brightness,
          locale: settingModel.locale,
        ));

  void changeLocaleUpdate() async {
    final lang = state.locale == LanguageType.english
        ? LanguageType.vietnamese
        : LanguageType.english;

    print('changeLocaleUpdate ${lang}');

    await PreferenceService().setLocale(lang.languageCode);
    emit(state.copyWith(locale: lang));
  }

  Stream<void> changeThemeUpdate(event, emit) async* {
    final brightness = state.brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    await PreferenceService().setThemeMode(brightness);
    emit(state.copyWith(brightness: brightness));
  }
}
