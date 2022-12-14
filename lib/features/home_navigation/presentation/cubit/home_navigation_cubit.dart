import 'package:alo_booking_app/features/bookings/presentation/screens/bookings_screen.dart';
import 'package:alo_booking_app/features/home_navigation/presentation/cubit/home_navigation_state.dart';
import 'package:alo_booking_app/features/hotels/presentation/screens/hotels_screen.dart';
import 'package:alo_booking_app/features/profile/presentation/screens/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationBloc extends Cubit<HomeNavigationState> {
  HomeNavigationBloc() : super(HomeNavigationInitialState());

  static HomeNavigationBloc get(context) =>
      BlocProvider.of<HomeNavigationBloc>(context);

  int currentIndex = 0;

  final Map<String, IconData> icons = {
    'Explore': Icons.search,
    'Bookings': CupertinoIcons.rectangle_on_rectangle_angled,
    'Profile': Icons.person_outline_rounded,
  };

  final List<Widget> screens = [
    const HotelsScreen(),
    // const Scaffold(),
    const BookingsScreen(),
    const ProfilePage(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState());
  }
}
