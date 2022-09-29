import 'package:alo_booking_app/core/exceptions/exceptions.dart';

abstract class BookingsState {
  const BookingsState();
}

class BookingsInitialState extends BookingsState {}

class CreateBookingLoadingState extends BookingsState {}

class CreateBookingFinishedState extends BookingsState {
  final String message;
  CreateBookingFinishedState({
    required this.message,
  });
}

class UpcomingBookingsLoadingState extends BookingsState {}

class UpcomingBookingsLoadedState extends BookingsState {}

class CompletedBookingsLoadingState extends BookingsState {}

class CompletedBookingsLoadedState extends BookingsState {}

class CanceledBookingsLoadingState extends BookingsState {}

class CanceledBookingsLoadedState extends BookingsState {}

class ErrorState extends BookingsState {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}
