import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:dartz/dartz.dart';

import '../repository/search_hotel_repository.dart';

class GetHotelsUseCase extends BaseUseCase<HotelsData, NoParameters> {
  final SearchHotelsRepository baseHotelRepository;

  GetHotelsUseCase(this.baseHotelRepository);

  @override
  Future<Either<PrimaryServerException, HotelsData>> call(
      NoParameters parameters) async {
    return await baseHotelRepository.getHotels();
  }
}
