import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';

class ProfileItemsWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData icon;

  const ProfileItemsWidget({
    Key? key,
    required this.text,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        height: MediaQuery.of(context).size.height * 0.055,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
              ),

            Icon(
              icon,
              color: AppThemeBloc.get(context).isDarkMode
                  ? AppDarkColors.accentColor1.withOpacity(0.7)
                  : AppLightColors.accentColor2,
              size: 28,
            ),
           ],
        ),
      ),
    );
  }
}
