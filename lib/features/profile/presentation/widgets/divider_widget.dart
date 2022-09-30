import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppDarkColors.accentColor,
      height: 0,
      thickness: 0.2,
    );
  }
}
