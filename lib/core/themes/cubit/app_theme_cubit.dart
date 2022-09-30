import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeBloc extends Cubit<AppThemeState> {
  AppThemeBloc() : super(AppThemesInitialState());

  static AppThemeBloc get(context) => BlocProvider.of<AppThemeBloc>(context);

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  ThemeMode themeMode = ThemeMode.system;

  Future<void> setAppTheme() async {
    final preferences = await getPreferences();
    preferences.setBool('AppTheme', isDarkMode);
  }

  Future<void> fetchAppTheme() async {
    final preferences = await getPreferences();
    final bool? isDarkModeFetched = preferences.getBool('AppTheme');

    isDarkModeFetched == null
        ? themeMode = ThemeMode.system
        : themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
    emit(AppThemeFetchedState());
  }

  final brightness = SchedulerBinding.instance.window.platformBrightness;
  bool get isDarkMode => brightness == Brightness.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    setAppTheme();
    emit(AppThemeChangedState());
  }
}
