import 'package:alo_booking_app/core/datasource/network/booking_remote_data_source.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseBookingRemoteDataSource baseBookingRemoteDataSource;

  HomeRepository(this.baseBookingRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, Login>> login(Auth auth) async {
    return await baseBookingRemoteDataSource.login(auth);
  }
}
