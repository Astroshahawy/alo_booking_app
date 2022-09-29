import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/core/routes/app_router.dart';
import 'package:alo_booking_app/core/themes/app_themes.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_cubit.dart';
import 'package:alo_booking_app/features/home_navigation/presentation/cubit/home_navigation_cubit.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/hotels/presentation/screens/hotels_screen.dart';
import '../features/search_hotels/presentation/screens/explore_page/explore_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeBloc>(
          create: (context) => getIt<AppThemeBloc>()..fetchAppTheme(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<HomeNavigationBloc>(
          create: (context) => getIt<HomeNavigationBloc>(),
        ),
        BlocProvider<BookingsBloc>(
          create: (context) => getIt<BookingsBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt<ProfileBloc>(),
        ),
        BlocProvider<SearchHotelsBloc>(
          create: (context) => getIt<SearchHotelsBloc>(),
        ),
      ],
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: AppThemeBloc.get(context).isDarkMode
                  ? Brightness.light
                  : Brightness.dark,
            ),
          );
          return MaterialApp(
            title: 'Alo Booking',
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            themeMode: AppThemeBloc.get(context).themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            onGenerateRoute: AppRouter.generateRoutes,
            // home: const ExplorePage(),
          );
        },
      ),
    );
  }
}
