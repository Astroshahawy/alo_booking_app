import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:dartz/dartz.dart';

import '../entities/search_hotels.dart';

abstract class SearchHotelsRepository {
  Future<Either<PrimaryServerException, SearchHotels>> searchHotels(dynamic searchOptionsModel);
  Future<Either<PrimaryServerException, HotelsData>> getHotels();
}
