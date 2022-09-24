import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/on_boarding_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/register_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.onBoardingScreen:
            return const OnBoardingScreen();
          case AppRoutes.loginScreen:
            return const LoginScreen();
          case AppRoutes.registerScreen:
            return const RegisterScreen();
          case AppRoutes.initScreen:
          default:
            return const WelcomeScreen();
        }
      },
    );
  }
}
