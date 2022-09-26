import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/welcome_photo.png',
          fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.25),
          colorBlendMode: BlendMode.darken,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          child: const Text(
            'Alo Booking',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          child: const Text(
            'Best hotel deals for your holiday',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 50,
          right: 50,
          bottom: MediaQuery.of(context).size.height * 0.08,
          child: BouncingButton(
            child: const Text(
              'Get started',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            onPress: () => Navigator.pushReplacementNamed(
                context, AppRoutes.onBoardingScreen),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height * 0.03,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have account?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.loginScreen),
                child: const Text(
                  ' Log in',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
