import 'package:alo_booking_app/core/datasource/network/booking_remote_data_source.dart';
import 'package:alo_booking_app/features/feature/data/models/auth_model.dart';
import 'package:alo_booking_app/features/feature/domain/entities/Login.dart';
import 'package:alo_booking_app/features/feature/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  HomeRepository(this.bookingRemoteDataSource);

  @override
  Future<Login> login(AuthModel auth) async {
    return await bookingRemoteDataSource.login(auth);
  }
}
