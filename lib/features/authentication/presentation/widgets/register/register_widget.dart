import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/utils/mac_alert_dialog.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_state.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/field_section.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/social_media_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SocialMediaButtonsRow(),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'or log in with email',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  color: AppThemeBloc.get(context).isDarkMode
                      ? AppDarkColors.accentColor1
                      : AppLightColors.accentColor1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FieldSection(
              title: 'Your name',
              child: TextFormField(
                controller: AuthBloc.get(context).registerNameController,
                keyboardType: TextInputType.name,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter your name',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor2
                        : AppLightColors.accentColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FieldSection(
              title: 'Your email',
              child: TextFormField(
                controller: AuthBloc.get(context).registerEmailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter your email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor2
                        : AppLightColors.accentColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FieldSection(
              title: 'Password',
              child: TextFormField(
                obscureText: true,
                controller: AuthBloc.get(context).registerPasswordController,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor2
                        : AppLightColors.accentColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FieldSection(
              title: 'Confirm password',
              child: TextFormField(
                obscureText: true,
                controller:
                    AuthBloc.get(context).registerConfirmPasswordController,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 're-enter password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor2
                        : AppLightColors.accentColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  macAlertDialog(context, state.exception.error);
                }
                if (state is UserRegisterValidationErrorState) {
                  macAlertDialog(context, state.error);
                }
                if (state is UserRegisterSuccessState) {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.loginScreen);
                }
              },
              child: BouncingButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                onPress: () {
                  FocusScope.of(context).unfocus();
                  AuthBloc.get(context).validateRegistration();
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'By signing up, you agreed with our terms of services and privacy policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor1
                        : AppLightColors.accentColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account?',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor1
                        : AppLightColors.accentColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.loginScreen),
                  child: const Text(
                    ' Log in',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.defaultColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
