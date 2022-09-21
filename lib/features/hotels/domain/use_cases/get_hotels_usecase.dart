import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/usecase/base_usecase.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/hotels/domain/repository/base_hotel_repository.dart';
import 'package:dartz/dartz.dart';

class GetHotelsUseCase extends BaseUseCase<HotelData, NoParameters> {
  final BaseHotelRepository baseHotelRepository;

  GetHotelsUseCase(this.baseHotelRepository);

  @override
  Future<Either<PrimaryServerException, HotelData>> call(
      NoParameters parameters) async {
    return await baseHotelRepository.getHotels();
  }
}
