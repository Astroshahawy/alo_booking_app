import 'package:alo_booking_app/features/authentication/presentation/widgets/welcome/welcome_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeWidget(),
    );
  }
}
