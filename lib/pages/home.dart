import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_card/blocs/app_settings/app_setting_event.dart';
import 'package:scan_card/blocs/app_settings/app_setting_bloc.dart';
import 'package:scan_card/blocs/app_settings/app_setting_state.dart';
import 'package:scan_card/l10n/localization_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final appSettingsBloc = BlocProvider.of<AppSettingBloc>(context);

    final appSettingCubit = BlocProvider.of<AppSettingCubit>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<AppSettingCubit, AppSettingState>(
                builder: (context, state) {
                  return RaisedButton(
                    onPressed: () {
                      //appSettingsBloc.add(ChangeLocale());
                      appSettingCubit.changeLocaleUpdate();
                    },
                    child: Text(LocalizationManager.localizations.language +
                        ' ' +
                        state.locale.name),
                  );
                },
              ),
              RaisedButton(
                onPressed: () async {
                  //appSettingsBloc.add(ChangeTheme());
                },
                child: Text(LocalizationManager.localizations.theme),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
