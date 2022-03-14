import 'package:scan_card/models/language_type.dart';
import 'package:scan_card/models/setting_model.dart';
import 'package:scan_card/services/preference.dart';

Future<SettingModel> loadSettings() async {
  PreferenceService service = PreferenceService();
  return SettingModel(
    brightness: await service.getThemeMode(),
    locale: await service.getLocale(),
  );
}
