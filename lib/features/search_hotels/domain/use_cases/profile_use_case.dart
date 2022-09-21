import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/search_hotels.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/search_options.dart';
import 'package:dartz/dartz.dart';

import '../repository/search_hotel_repository.dart';

class SearchHotelsInfo extends BaseUseCase<SearchHotels, SearchOptions> {
  final SearchHotelsRepository searchHotelsRepository;

  SearchHotelsInfo({required this.searchHotelsRepository});

  @override
  Future<Either<PrimaryServerException, SearchHotels>> call(
      SearchOptions parameters) async {
    return await searchHotelsRepository.searchHotels(parameters);
  }
}
