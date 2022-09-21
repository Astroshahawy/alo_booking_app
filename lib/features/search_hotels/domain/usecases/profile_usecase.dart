
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/search_hotels.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/search_options.dart';
import 'package:dartz/dartz.dart';

import '../repository/search_hotel_repository.dart';

class SearchHotelsInfo {
  final SearchHotelsRepository searchHotelsRepository;

  SearchHotelsInfo({required this.searchHotelsRepository});

  Future<Either<PrimaryServerException, SearchHotels>> call(SearchOptions searchHotels) async {
    return await searchHotelsRepository.searchHotels(searchHotels);
  }
}
