
import 'package:alo_booking_app/features/search_hotels/domain/entities/facilities_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/search_hotel_repository.dart';

class GetFacilitiesInfo extends BaseUseCase<FacilitiesData, NoParameters> {
  final SearchHotelsRepository getFacilitiesRepository;

  GetFacilitiesInfo({required this.getFacilitiesRepository});

  @override
  Future<Either<PrimaryServerException, FacilitiesData>> call(
      NoParameters parameters) async {
    return await getFacilitiesRepository.getFacilities();
  }
}
