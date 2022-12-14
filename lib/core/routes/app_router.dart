import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/on_boarding_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/register_screen.dart';
import 'package:alo_booking_app/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:alo_booking_app/features/home_navigation/presentation/screens/home_bottom_navigation_bar.dart';
import 'package:alo_booking_app/features/hotels/presentation/screens/hotels_screen.dart';
import 'package:alo_booking_app/features/hotels/presentation/screens/details_screen.dart';
import 'package:alo_booking_app/features/profile/presentation/screens/update_page/update_profile_page.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/explore_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.exploreScreen:
            return const ExplorePage();
          case AppRoutes.updateProfilePageScreen:
            return UpdateProfilePage();
          case AppRoutes.bottomNavigationBaseScreen:
            return const HomeBottomNavigationBar();
          case AppRoutes.detailsScreen:
            return const DetailsScreen();
          case AppRoutes.hotelsScreen:
            return const HotelsScreen();
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
