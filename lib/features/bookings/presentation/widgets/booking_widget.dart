import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';

class BookingsWidget extends StatelessWidget {
  const BookingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'My Bookings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: (context, state) {
              return DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppThemeBloc.get(context).isDarkMode
                            ? AppDarkColors.primaryColor
                            : AppLightColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 7.0,
                            offset: const Offset(0.0, 5.0),
                          ),
                        ],
                      ),
                      child: TabBar(
                        overlayColor: MaterialStateProperty.all(
                            AppColors.defaultColor.withOpacity(0.3)),
                        indicatorColor: Colors.transparent,
                        indicatorWeight: 0.1,
                        labelColor: AppColors.defaultColor,
                        unselectedLabelColor: AppLightColors.accentColor1,
                        splashFactory: NoSplash.splashFactory,
                        splashBorderRadius: BorderRadius.circular(100),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: const [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Completed'),
                          Tab(text: 'Canceled'),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const TabBarPages(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
