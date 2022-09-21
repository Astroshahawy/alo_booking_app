import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/models/auth_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/register_model.dart';
import 'package:dartz/dartz.dart';


abstract class BaseAuthRemoteDataSource {
  Future<Either<PrimaryServerException, AuthModel>> login(
      LoginModel loginModel);
  Future<Either<PrimaryServerException, AuthModel>> register(
      RegisterModel registerModel);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  AuthRemoteDataSource(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, AuthModel>> login(
      LoginModel loginModel) async {
    return basicErrorHandling<AuthModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.loginEndPoint,
          data: loginModel.toJson(),
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
      RegisterModel registerModel) {
    return basicErrorHandling<AuthModel>(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.registerEndPoint,
          data: registerModel.toJson(),
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
