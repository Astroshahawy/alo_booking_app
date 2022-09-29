import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking_creation.dart';
import 'package:alo_booking_app/features/bookings/domain/repository/base_bookings_repository.dart';

class CreateBookingsUseCase
    extends BaseUseCase<BookingCreation, CreateBookingsParameters> {
  final BaseBookingsRepository baseBookingRepository;

  CreateBookingsUseCase(this.baseBookingRepository);

  @override
  Future<Either<PrimaryServerException, BookingCreation>> call(
      CreateBookingsParameters parameters) async {
    return await baseBookingRepository.createBooking(
      token: parameters.token,
      hotelId: parameters.hotelId,
    );
  }
}

class CreateBookingsParameters extends Equatable {
  final String token;
  final int hotelId;
  const CreateBookingsParameters(
    this.token,
    this.hotelId,
  );

  @override
  List<Object> get props => [token, hotelId];
}
