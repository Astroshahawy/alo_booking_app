import 'package:alo_booking_app/core/constants/constants.dart';
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
          body: IndexedStack(
            index: HomeNavigationBloc.get(context).currentIndex,
            children: [...HomeNavigationBloc.get(context).screens],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: HomeNavigationBloc.get(context)
                .icons
                .map(
                  (title, icon) => MapEntry(
                    title,
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
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
            iconSize: 32,
            unselectedFontSize: 14,
            selectedLabelStyle: const TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
            unselectedItemColor: Colors.grey.shade400,
            onTap: (index) =>
                HomeNavigationBloc.get(context).changeScreen(index),
          ),
        );
      },
    );
  }
}
