import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking.dart';
import 'package:alo_booking_app/features/bookings/domain/repository/base_bookings_repository.dart';
import 'package:alo_booking_app/features/bookings/domain/use_case/booking_parameter.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCompletedBookingsUseCase
    extends BaseUseCase<List<Booking>, GetBookingsParameters> {
  final BaseBookingsRepository baseBookingRepository;

  GetCompletedBookingsUseCase(this.baseBookingRepository);

  @override
  Future<Either<PrimaryServerException, List<Booking>>> call(
      GetBookingsParameters parameters) async {
    return await baseBookingRepository.getCompletedBookings(
      token: parameters.token,
    );
  }
}