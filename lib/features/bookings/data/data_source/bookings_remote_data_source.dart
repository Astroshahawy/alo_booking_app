import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/bookings/data/models/booking_creation_model.dart';
import 'package:alo_booking_app/features/bookings/data/models/booking_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBookingsRemoteDataSource {
  Future<Either<PrimaryServerException, BookingCreationModel>> createBooking({
    required String token,
    required int hotelId,
  });
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getUpcomingBookings({
    required String token,
    String type,
  });
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getCompletedBookings({
    required String token,
    String type,
  });
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getCanceledBookings({
    required String token,
    String type,
  });
}

class BookingsRemoteDataSource extends BaseBookingsRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  BookingsRemoteDataSource(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, BookingCreationModel>> createBooking(
      {required String token, required int hotelId}) {
    return basicErrorHandling<BookingCreationModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.createBookingEndPoint,
          token: token,
          data: {'hotel_id': hotelId},
        );
        return BookingCreationModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getCanceledBookings({required String token, String? type}) {
    return basicErrorHandling<List<BookingModel>>(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.getBookingsEndPoint,
          token: token,
          query: {'type': 'cancelled'},
        );
        return List<BookingModel>.from(
            response['data']['data'].map((e) => BookingModel.fromJson(e)));
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getCompletedBookings({required String token, String? type}) {
    return basicErrorHandling<List<BookingModel>>(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.getBookingsEndPoint,
          token: token,
          query: {'type': 'completed'},
        );
        return List<BookingModel>.from(
            response['data']['data'].map((e) => BookingModel.fromJson(e)));
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, List<BookingModel>>>
      getUpcomingBookings({required String token, String? type}) {
    return basicErrorHandling<List<BookingModel>>(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.getBookingsEndPoint,
          token: token,
          query: {'type': 'upcomming'},
        );
        return List<BookingModel>.from(
            response['data']['data'].map((e) => BookingModel.fromJson(e)));
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on BaseBookingsRemoteDataSource {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();

      return Right(r);
    } on PrimaryServerException catch (e) {
      return Left(e);
    }
  }
}
