import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';
import 'package:alo_booking_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc(
    this.loginUseCase,
    this.registerUseCase,
  ) : super(AuthInitialState());

  static AuthBloc get(context) => BlocProvider.of<AuthBloc>(context);

  late Auth auth;
  Future<void> userLogin() async {
    emit(UserLoginLoadingState());

    final response = await loginUseCase(
      const Login(
        email: 'ahmedshahawy1@gmail.com',
        password: '123456',
      ),
    );

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) {
        auth = right;
        emit(UserLoginSuccessState());
      },
    );
  }

  Future<void> userRegister() async {
    emit(UserRegisterLoadingState());

    final response = await registerUseCase(
      const Register(
        name: 'ahmed Shahawy2',
        email: 'ahmedshahawy2@gmail.com',
        password: '123456',
        passwordConfirmation: '123456',
      ),
    );

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) {
        auth = right;
        emit(UserRegisterSuccessState());
      },
    );
  }
}
