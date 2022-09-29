import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/home_navigation/presentation/cubit/home_navigation_cubit.dart';
import 'package:alo_booking_app/features/home_navigation/presentation/cubit/home_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationBloc, HomeNavigationState>(
      buildWhen: (previous, current) => current is ChangeScreenState,
      builder: (context, state) {
        return Scaffold(
          body: HomeNavigationBloc.get(context).screens[HomeNavigationBloc.get(context).currentIndex],
          // body: IndexedStack(
          //   index: HomeNavigationBloc.get(context).currentIndex,
          //   children: [...HomeNavigationBloc.get(context).screens],
          // ),
          bottomNavigationBar: BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, state) {
              return BottomNavigationBar(
                backgroundColor: AppThemeBloc.get(context).isDarkMode
                    ? AppDarkColors.primaryColor
                    : AppLightColors.primaryColor,
                type: BottomNavigationBarType.fixed,
                items: HomeNavigationBloc.get(context)
                    .icons
                    .map(
                      (title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Icon(icon),
                          ),
                          label: title,
                        ),
                      ),
                    )
                    .values
                    .toList(),
                currentIndex: HomeNavigationBloc.get(context).currentIndex,
                selectedItemColor: AppColors.defaultColor,
                iconSize: 30,
                elevation: 0,
                unselectedFontSize: 14,
                selectedLabelStyle: const TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                ),
                unselectedItemColor: AppThemeBloc.get(context).isDarkMode
                    ? AppDarkColors.accentColor1
                    : AppLightColors.accentColor1,
                onTap: (index) =>
                    HomeNavigationBloc.get(context).changeScreen(index),
              );
            },
          ),
        );
      },
    );
  }
}
