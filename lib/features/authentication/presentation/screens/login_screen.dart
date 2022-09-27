import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/login/login_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AuthBloc.get(context).clearLoginControllers();
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 68,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: const LoginWidget(),
        ),
      ),
    );
  }
}
