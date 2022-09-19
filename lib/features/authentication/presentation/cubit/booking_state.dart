import 'package:alo_booking_app/core/exceptions/exceptions.dart';

abstract class BookingState {
  const BookingState();
}

class BookingInitialState extends BookingState {}

class UserLoginLoadingState extends BookingState {}

class UserLoginSuccessState extends BookingState {}

class ErrorState extends BookingState {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}
