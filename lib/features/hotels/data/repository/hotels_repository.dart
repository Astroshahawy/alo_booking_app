import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/hotels/data/data_source/base_hotels_data_source.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class HotelsRepository extends BaseHotelRepository {
  final BaseHotelsRemoteDataSource baseHotelsRemoteDataSource;

  HotelsRepository(this.baseHotelsRemoteDataSource);

  @override
  Future<Either<PrimaryServerException, HotelData>> getHotels() async {
    return await baseHotelsRemoteDataSource.getHotels();
  }
}
