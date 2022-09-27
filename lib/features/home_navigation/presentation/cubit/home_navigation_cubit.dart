import 'package:alo_booking_app/features/home_navigation/presentation/cubit/home_navigation_state.dart';
import 'package:alo_booking_app/features/profile/presentation/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationBloc extends Cubit<HomeNavigationState> {
  HomeNavigationBloc() : super(HomeNavigationInitialState());

  static HomeNavigationBloc get(context) =>
      BlocProvider.of<HomeNavigationBloc>(context);

  int currentIndex = 0;

  final Map<String, IconData> icons = {
    'Explore': Icons.search,
    'Trips': Icons.favorite_border_outlined,
    'Profile': Icons.person_outline_rounded,
  };

  final List<Widget> screens = [
    // const HotelsScreen(key: PageStorageKey(AppRoutes.hotelsScreen)),
    const Scaffold(),
    const Scaffold(),
    const ProfilePage(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
  }
}
