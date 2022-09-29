import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.defaultColor),
        backgroundColor: AppLightColors.accentColor,
      ),
    );
  }
}
