import 'package:flutter/material.dart';

class AppRoutes {
  static const initScreen = '/';
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
}

const String serverFailureMessage = 'Please try again later .';
const String offlineFailureMessage = 'Please Check your Internet Connection';
const String addSuccessMessage = 'Weather Location Added Successfully';
