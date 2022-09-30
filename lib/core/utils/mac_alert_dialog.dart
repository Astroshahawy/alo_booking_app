import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

macAlertDialog(BuildContext context, String message) {
  showMacosAlertDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppThemeBloc.get(context).isDarkMode
            ? AppDarkColors.accentColor
            : AppLightColors.accentColor,
        title: const Text(
          'Warning!',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: AppThemeBloc.get(context).isDarkMode
                ? AppDarkColors.accentColor2
                : AppLightColors.accentColor2,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColors.defaultColor,
                letterSpacing: 0.5,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 70,
        ),
      );
    },
  );
}
