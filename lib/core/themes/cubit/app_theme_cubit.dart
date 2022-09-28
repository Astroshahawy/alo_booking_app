import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBloc extends Cubit<AppThemeState> {
  AppThemeBloc() : super(AppThemesInitialState());

  static AppThemeBloc get(context) => BlocProvider.of<AppThemeBloc>(context);

  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    emit(AppThemeChangedState());
  }
}
