import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/on_boarding/page_view_section.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.83,
          child: const PageViewSection(),
        ),
        BouncingButton(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          onPress: () => Navigator.pushNamed(context, AppRoutes.loginScreen),
        ),
        const SizedBox(
          height: 15,
        ),
        BouncingButton(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          color: Colors.white,
          applyShadow: true,
          child: const Text(
            'Create account',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          onPress: () => Navigator.pushNamed(context, AppRoutes.registerScreen),
        ),
      ],
    );
  }
}
