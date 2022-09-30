import 'dart:convert';

import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/register_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:alo_booking_app/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc(
    this.loginUseCase,
    this.registerUseCase,
  ) : super(AuthInitialState());

  static AuthBloc get(context) => BlocProvider.of<AuthBloc>(context);

  late Auth auth;

  final TextEditingController loginEmailController = TextEditingController();
  // TextEditingController(text: 'alobookingapp@alo.com');
  final TextEditingController loginPasswordController = TextEditingController();
  // TextEditingController(text: '123456');

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveUserLoginCredentials(LoginModel loginCredentials) async {
    final preferences = await getPreferences();
    preferences.setString(
        'LoginCredentials', jsonEncode(loginCredentials.toJson()));
  }

  Future<void> fetchUserLoginCredentials() async {
    final preferences = await getPreferences();
    if (preferences.getString('LoginCredentials') != null) {
      final fetchedLoginCredentials = LoginModel.fromJson(
        jsonDecode(preferences.getString('LoginCredentials')!),
      );
      loginEmailController.text = fetchedLoginCredentials.email;
      loginPasswordController.text = fetchedLoginCredentials.password;
    }
  }

  Future<void> userLogin() async {
    emit(UserLoginLoadingState());

    final loginCredentials = LoginModel(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );

    final response = await loginUseCase(loginCredentials);

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) async {
        auth = right;
        saveUserLoginCredentials(loginCredentials);
        clearLoginControllers();
        emit(UserLoginSuccessState());
      },
    );
  }

  Future<void> validateLogin() async {
    if (loginEmailController.text.trim().isEmpty ||
        loginPasswordController.text.trim().isEmpty ||
        loginPasswordController.text.trim().length < 6 ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(
          loginEmailController.text.trim(),
        )) {
      emit(
        UserLoginValidationErrorState(
          error: ((loginEmailController.text.trim().isEmpty
                      ? '\nEmail cannot be empty,\nplease enter your Email\n'
                      : '') +
                  (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(
                    loginEmailController.text.trim(),
                  )
                      ? ''
                      : '\nPlease enter a valid email address, abc@xyz.com\n') +
                  (loginPasswordController.text.trim().isEmpty ||
                          loginPasswordController.text.trim().length < 6
                      ? '\nWe cannot allow a password which is less than 6 characters,\nplease enter a valid password\n'
                      : ''))
              .trim(),
        ),
      );
      return;
    }
    await userLogin();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();

  Future<void> userRegister() async {
    emit(UserRegisterLoadingState());

    final response = await registerUseCase(
      RegisterModel(
        name: registerNameController.text.trim(),
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text.trim(),
        passwordConfirmation: registerConfirmPasswordController.text.trim(),
      ),
    );

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) {
        auth = right;
        loginEmailController.text = registerEmailController.text;
        loginPasswordController.text = registerPasswordController.text;
        clearRegisterControllers();
        emit(UserRegisterSuccessState());
      },
    );
  }

  Future<void> validateRegistration() async {
    if (registerNameController.text.trim().isEmpty ||
        registerEmailController.text.trim().isEmpty ||
        registerPasswordController.text.trim().isEmpty ||
        registerPasswordController.text.trim().length < 6 ||
        registerConfirmPasswordController.text.trim().isEmpty ||
        registerConfirmPasswordController.text !=
            registerPasswordController.text ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(
          registerEmailController.text.trim(),
        )) {
      emit(
        UserRegisterValidationErrorState(
          error: ((registerNameController.text.trim().isEmpty
                      ? '\nName cannot be empty,\nplease enter your name\n'
                      : '') +
                  (registerEmailController.text.trim().isEmpty
                      ? '\nEmail cannot be empty,\nplease enter your Email\n'
                      : '') +
                  (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(
                    registerEmailController.text.trim(),
                  )
                      ? ''
                      : '\nPlease enter a valid email address, abc@xyz.com\n') +
                  (registerPasswordController.text.trim().isEmpty ||
                          registerPasswordController.text.trim().length < 6
                      ? '\nWe cannot allow a password which is less than 6 characters,\nplease enter a valid password\n'
                      : '') +
                  (registerConfirmPasswordController.text.trim().isEmpty ||
                          registerConfirmPasswordController.text !=
                              registerPasswordController.text
                      ? '\nPasswords do not match,\nplease enter a matching password\n'
                      : ''))
              .trim(),
        ),
      );
      return;
    }
    await userRegister();
  }

  void clearRegisterControllers() {
    registerNameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    registerConfirmPasswordController.clear();
  }
}
