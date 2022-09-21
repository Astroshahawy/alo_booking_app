import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../entities/search_hotels.dart';

abstract class SearchHotelsRepository {
  Future<Either<PrimaryServerException, SearchHotels>> searchHotels(dynamic searchOptionsModel);
}
