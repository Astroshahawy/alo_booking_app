import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeBloc extends Cubit<AppThemeState> {
  AppThemeBloc() : super(AppThemesInitialState());

  static AppThemeBloc get(context) => BlocProvider.of<AppThemeBloc>(context);

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  ThemeMode themeMode = ThemeMode.system;

  Future<void> setAppTheme() async {
    final prefs = await getPrefs();
    prefs.setBool('AppTheme', isDarkMode);
  }

  Future<void> fetchAppTheme() async {
    final prefs = await getPrefs();
    final bool isDarkModeFetched =
        prefs.getBool('AppTheme') ?? themeMode == ThemeMode.system;
    themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
    emit(AppThemeFetchedState());
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    setAppTheme();
    emit(AppThemeChangedState());
  }
}
