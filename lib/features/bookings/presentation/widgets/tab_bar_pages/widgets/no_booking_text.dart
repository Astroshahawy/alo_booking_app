import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NoBookingText extends StatelessWidget {
  final String text;
  const NoBookingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: AppLightColors.accentColor1,
        ),
      ),
    );
  }
}
