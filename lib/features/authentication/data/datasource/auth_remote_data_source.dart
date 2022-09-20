import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/models/auth_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Either<PrimaryServerException, AuthModel>> login(Login login);
  Future<Either<PrimaryServerException, AuthModel>> register(Register register);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  AuthRemoteDataSource(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, AuthModel>> login(Login login) async {
    return basicErrorHandling<AuthModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.loginEndPoint,
          data: {
            'email': login.email,
            'password': login.password,
          },
        );
        return AuthModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, AuthModel>> register(
      Register register) {
    return basicErrorHandling<AuthModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.registerEndPoint,
          data: {
            'name': register.name,
            'email': register.email,
            'password': register.password,
            'password_confirmation': register.passwordConfirmation,
          },
        );
        return AuthModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on BaseAuthRemoteDataSource {
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
