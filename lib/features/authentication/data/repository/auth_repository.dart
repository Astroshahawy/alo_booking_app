import 'package:alo_booking_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/register_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseBookingRemoteDataSource;

  AuthRepository(this.baseBookingRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, Auth>> login(
      LoginModel loginModel) async {
    return await baseBookingRemoteDataSource.login(loginModel);
  }

  @override
  Future<Either<PrimaryServerException, Auth>> register(
      RegisterModel registerModel) async {
    return await baseBookingRemoteDataSource.register(registerModel);
  }
}
