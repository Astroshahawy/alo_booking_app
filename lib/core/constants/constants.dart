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
  static const Color defaultColor = Color(0xFF4FBE9E);
}
