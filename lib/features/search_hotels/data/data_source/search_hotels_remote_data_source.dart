import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/hotels_data_model.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/search_hotels_model.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/search_options_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';

abstract class SearchHotelsRemoteDataSource {
  Future<Either<PrimaryServerException, SearchHotelsModel>> searchHotelsInfo(
      SearchOptionsModel searchOptionsModel);
  Future<Either<PrimaryServerException, HotelsDataModel>> getHotels();
}

class SearchHotelsRemoteDataSourceImpl extends SearchHotelsRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  SearchHotelsRemoteDataSourceImpl(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, SearchHotelsModel>> searchHotelsInfo(
      SearchOptionsModel searchOptionsModel) async {
    return basicErrorHandling(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.searchHotelsEndPoint,
          query: searchOptionsModel.toJson(),
        );
        return SearchHotelsModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

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

extension on SearchHotelsRemoteDataSource {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e) {
      //debugPrint(s.toString());
      return Left(e);
    }
  }
}
