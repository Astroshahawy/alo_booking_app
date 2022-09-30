import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/domain/entities/user.dart';
import '../../widgets/divider_widget.dart';
import 'widget/profile_items_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userInfo = AuthBloc.get(context).auth.userData;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, AppRoutes.updateProfilePageScreen),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userInfo.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'View and Edit Profile',
                            style: TextStyle(
                              color: AppThemeBloc.get(context).isDarkMode
                                  ? AppDarkColors.accentColor1
                                  : AppLightColors.accentColor2,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      if (userInfo.image.isEmpty)
                        const CircleAvatar(
                          radius: 34.0,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                      if (userInfo.image.isNotEmpty)
                        CircleAvatar(
                          radius: 34.0,
                          backgroundImage:
                              NetworkImage(AppApis.getImageUrl(userInfo.image)),
                          backgroundColor: AppColors.borderSideColor,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ProfileItemsWidget(
                text: 'Change Password',
                icon: Icons.lock,
              ),
              const DividerWidget(),
              const ProfileItemsWidget(
                icon: Icons.people_rounded,
                text: 'Invite Friend',
              ),
              const DividerWidget(),
              const ProfileItemsWidget(
                icon: Icons.wallet_giftcard_rounded,
                text: 'Credit & Coupons',
              ),
              const DividerWidget(),
              const ProfileItemsWidget(
                icon: Icons.error_outlined,
                text: 'Help Center',
              ),
              const DividerWidget(),
              const ProfileItemsWidget(
                icon: Icons.payment,
                text: 'Payment',
              ),
              const DividerWidget(),
              const ProfileItemsWidget(
                icon: Icons.settings,
                text: 'Setting',
              ),
              const DividerWidget(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                height: MediaQuery.of(context).size.height * 0.055,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                    BlocBuilder<AppThemeBloc, AppThemeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                          activeColor: AppColors.defaultColor,
                          trackColor: AppLightColors.accentColor1,
                          value: AppThemeBloc.get(context).isDarkMode,
                          onChanged: (value) =>
                              AppThemeBloc.get(context).toggleTheme(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
