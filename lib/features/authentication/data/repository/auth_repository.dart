import 'package:alo_booking_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseBookingRemoteDataSource;

  AuthRepository(this.baseBookingRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, Auth>> login(Login login) async {
    return await baseBookingRemoteDataSource.login(login);
  }

  @override
  Future<Either<PrimaryServerException, Auth>> register(
      Register register) async {
    return await baseBookingRemoteDataSource.register(register);
  }
}
