import 'package:flutter/material.dart';

class AppRoutes {
  static const initScreen = '/';
  static const loginScreen = 'login_screen';
  static const registerScreen = 'register_screen';
  static const onBoardingScreen = 'on_boarding_screen';

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
  static const Color defaultColor = Color(0xFF4FBE9E);
}

const String serverFailureMessage = 'Please try again later .';
const String offlineFailureMessage = 'Please Check your Internet Connection';
const String addSuccessMessage = 'Weather Location Added Successfully';
