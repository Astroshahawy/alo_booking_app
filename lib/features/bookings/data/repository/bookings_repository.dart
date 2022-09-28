import 'package:dartz/dartz.dart';

import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/bookings/data/data_source/bookings_remote_data_source.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking_creation.dart';
import 'package:alo_booking_app/features/bookings/domain/repository/base_bookings_repository.dart';

class BookingsRepository extends BaseBookingsRepository {
  final BaseBookingsRemoteDataSource baseBookingsRemoteDataSource;

  BookingsRepository(this.baseBookingsRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, BookingCreation>> createBooking(
      {required String token, required int hotelId}) async {
    return await baseBookingsRemoteDataSource.createBooking(
        token: token, hotelId: hotelId);
  }

  @override
  Future<Either<PrimaryServerException, List<Booking>>> getCanceledBookings(
      {required String token, String? type}) async {
    return await baseBookingsRemoteDataSource.getCanceledBookings(token: token);
  }

  @override
  Future<Either<PrimaryServerException, List<Booking>>> getCompletedBookings(
      {required String token, String? type}) async {
    return await baseBookingsRemoteDataSource.getCompletedBookings(
        token: token);
  }

  @override
  Future<Either<PrimaryServerException, List<Booking>>> getUpcomingBookings(
      {required String token, String? type}) async {
    return await baseBookingsRemoteDataSource.getUpcomingBookings(token: token);
  }
}
