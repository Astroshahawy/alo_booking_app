import 'package:alo_booking_app/features/hotels/domain/entities/hotels_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';

abstract class BaseHotelRepository {
  Future<Either<PrimaryServerException, HotelData>> getHotels();
}
