import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/widgets/register/register_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AuthBloc.get(context).clearRegisterControllers();
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
          body: const RegisterWidget(),
        ),
      ),
    );
  }
}
