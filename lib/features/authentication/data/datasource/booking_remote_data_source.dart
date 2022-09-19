import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';

abstract class BaseBookingRemoteDataSource {
  Future<Either<PrimaryServerException, LoginModel>> login(Auth auth);
}

class BookingRemoteDataSource extends BaseBookingRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  BookingRemoteDataSource(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, LoginModel>> login(Auth auth) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.loginEndPoint,
          data: {
            'email': auth.email,
            'password': auth.password,
          },
        );
        return LoginModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on BaseBookingRemoteDataSource {
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
