import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/utils/mac_alert_dialog.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_state.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/field_section.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/social_media_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

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
              'Login',
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
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FieldSection(
              title: 'Your email',
              child: TextFormField(
                controller: AuthBloc.get(context).loginEmailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter your email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Colors.grey.shade400,
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
                controller: AuthBloc.get(context).loginPasswordController,
                obscureText: true,
                cursorColor: AppColors.defaultColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  macAlertDialog(context, state.exception.error);
                }
                if (state is UserLoginValidationErrorState) {
                  macAlertDialog(context, state.error);
                }
              },
              child: BouncingButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                onPress: () {
                  FocusScope.of(context).unfocus();
                  AuthBloc.get(context).validateLogin().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.bottomNavigationBaseScreen,
                          (route) => false));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
