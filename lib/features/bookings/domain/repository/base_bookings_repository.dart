import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking_creation.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBookingsRepository {
  Future<Either<PrimaryServerException, BookingCreation>> createBooking({
    required String token,
    required int hotelId,
  });
  Future<Either<PrimaryServerException, List<Booking>>> getUpcomingBookings({
    required String token,
    String type,
  });
  Future<Either<PrimaryServerException, List<Booking>>> getCompletedBookings({
    required String token,
    String type,
  });
  Future<Either<PrimaryServerException, List<Booking>>> getCanceledBookings({
    required String token,
    String type,
  });
}
