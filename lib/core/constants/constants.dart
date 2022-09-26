import 'package:flutter/material.dart';

class AppRoutes {
  static const initScreen = '/';
  static const loginScreen = 'login_screen';
  static const registerScreen = 'register_screen';
  static const onBoardingScreen = 'on_boarding_screen';
  static const hotelsScreen = 'hotels_screen';
}

class AppApis {
  static const String baseUrl = 'http://api.mahmoudtaha.com';
  static const String version = '/api';
  static const String loginEndPoint = '/auth/login';
  static const String registerEndPoint = '/auth/register';
  static const String profileEndPoint = '/auth/profile-info';
  static const String updateProfileEndPoint = '/auth/update-info';
  static const String hotelsEndPoint = '/hotels';
  static const String searchHotelsEndPoint = '/search-hotels';
}

class AppColors {
  static const Color baseColor = Color(0xFF1A1A1A);
  static const Color defaultColor = Color(0xFF4FBE9E);
  static const Color borderSideColor = Color(0xFF717171);
  static const Color cardColor = Color(0xFF2C2C2C);
}

const String serverFailureMessage = 'Please try again later .';
const String offlineFailureMessage = 'Please Check your Internet Connection';
const String addSuccessMessage = 'Weather Location Added Successfully';
