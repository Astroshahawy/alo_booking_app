import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking.dart';
import 'package:alo_booking_app/features/bookings/domain/use_case/booking_parameter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_booking_app/features/bookings/domain/use_case/create_booking_use_case.dart';
import 'package:alo_booking_app/features/bookings/domain/use_case/get_canceled_bookings_use_case.dart';
import 'package:alo_booking_app/features/bookings/domain/use_case/get_completed_bookings_use_case.dart';
import 'package:alo_booking_app/features/bookings/domain/use_case/get_upcoming_bookings_use_case.dart';
import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_state.dart';

class BookingsBloc extends Cubit<BookingsState> {
  final CreateBookingsUseCase createBookingsUseCase;
  final GetUpcomingBookingsUseCase getUpcomingBookingsUseCase;
  final GetCompletedBookingsUseCase getCompletedBookingsUseCase;
  final GetCanceledBookingsUseCase getCanceledBookingsUseCase;

  BookingsBloc(
    this.createBookingsUseCase,
    this.getUpcomingBookingsUseCase,
    this.getCompletedBookingsUseCase,
    this.getCanceledBookingsUseCase,
  ) : super(BookingsInitialState());

  static BookingsBloc get(context) => BlocProvider.of<BookingsBloc>(context);

  Future<void> createBooking({required int hotelId, context}) async {
    final response = await createBookingsUseCase(CreateBookingsParameters(
        AuthBloc.get(context).auth.userData.token, hotelId));

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) {
        emit(CreateBookingFinishedState(message: right.status.messageEn));
        getUpcomingBookings(context);
        getCompletedBookings(context);
        getCanceledBookings(context);
      },
    );
  }

  List<Booking> upcomingBookings = [];
  Future<void> getUpcomingBookings(context) async {
    if (upcomingBookings.isEmpty) {
      emit(UpcomingBookingsLoadingState());
      final response = await getUpcomingBookingsUseCase(
          GetBookingsParameters(AuthBloc.get(context).auth.userData.token));

      response.fold(
        (left) {
          emit(ErrorState(exception: left));
        },
        (right) {
          upcomingBookings = right;
          emit(UpcomingBookingsLoadedState());
        },
      );
    }
  }

  List<Booking> completedBookings = [];
  Future<void> getCompletedBookings(context) async {
    if (completedBookings.isEmpty) {
      emit(CompletedBookingsLoadingState());
      final response = await getCompletedBookingsUseCase(
          GetBookingsParameters(AuthBloc.get(context).auth.userData.token));

      response.fold(
        (left) {
          emit(ErrorState(exception: left));
        },
        (right) {
          completedBookings = right;
          emit(CompletedBookingsLoadedState());
        },
      );
    }
  }

  List<Booking> canceledBookings = [];
  Future<void> getCanceledBookings(context) async {
    if (canceledBookings.isEmpty) {
      final response = await getCanceledBookingsUseCase(
          GetBookingsParameters(AuthBloc.get(context).auth.userData.token));

      response.fold(
        (left) {
          emit(ErrorState(exception: left));
        },
        (right) {
          canceledBookings = right;
          emit(CanceledBookingsLoadedState());
        },
      );
    }
  }
}
