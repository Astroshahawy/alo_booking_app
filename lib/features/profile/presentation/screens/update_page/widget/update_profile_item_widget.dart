import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';

class UpdateProfileItemWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final String subText;
  final bool editable;

  const UpdateProfileItemWidget({
    Key? key,
    required this.text,
    required this.subText,
    this.controller,
    this.editable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.055,
      padding: const EdgeInsets.only(left: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppThemeBloc.get(context).isDarkMode
                  ? AppDarkColors.accentColor1.withOpacity(0.7)
                  : AppLightColors.accentColor2,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Flexible(
            child: editable
                ? TextField(
                    textAlign: TextAlign.end,
                    controller: controller,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: subText,
                      hintStyle: TextStyle(
                        color: AppThemeBloc.get(context).isDarkMode
                            ? AppLightColors.primaryColor
                            : AppDarkColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Text(
                    subText,
                    style: TextStyle(
                      color: AppThemeBloc.get(context).isDarkMode
                          ? AppLightColors.primaryColor
                          : AppDarkColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
