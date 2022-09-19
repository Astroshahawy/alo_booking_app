import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/core/routes/app_router.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingBloc>(
          create: (context) => getIt<BookingBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        darkTheme: ThemeData.dark(),
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
