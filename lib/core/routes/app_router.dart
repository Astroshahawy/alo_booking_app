import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.initScreen:
          default:
            return const HomeScreen();
        }
      },
    );
  }
}
