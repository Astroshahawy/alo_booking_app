import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/hotels/data/models/hotels_data_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHotelsRemoteDataSource {
  Future<Either<PrimaryServerException, HotelsDataModel>> getHotels();
}
class HotelsRemoteDataSource extends BaseHotelsRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  HotelsRemoteDataSource(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, HotelsDataModel>> getHotels() {
    return basicErrorHandling<HotelsDataModel>(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.hotelsEndPoint,
          data: {
            'count': 10,
            'page': 1,
          },
        );
        return HotelsDataModel.fromJson(response['data']);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );

  }


}
extension on BaseHotelsRemoteDataSource {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
    onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();

      return Right(r);
    } on PrimaryServerException catch (e) {
      return Left(e);
    }
  }
}