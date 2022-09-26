import 'package:alo_booking_app/core/exceptions/exceptions.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class UserLoginLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class UserLoginValidationErrorState extends AuthState {
  final String error;

  UserLoginValidationErrorState({
    required this.error,
  });
}

class UserRegisterLoadingState extends AuthState {}

class UserRegisterSuccessState extends AuthState {}

class UserRegisterValidationErrorState extends AuthState {
  final String error;

  UserRegisterValidationErrorState({
    required this.error,
  });
}

class ErrorState extends AuthState {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}
