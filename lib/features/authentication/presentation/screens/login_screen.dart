import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/login/login_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    AuthBloc.get(context).fetchUserLoginCredentials();
  }

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
