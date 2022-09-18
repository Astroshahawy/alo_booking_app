import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();

  runApp(const MyApp());
}
