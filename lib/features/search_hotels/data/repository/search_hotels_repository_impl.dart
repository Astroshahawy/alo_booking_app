import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/search_hotels.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/search_hotel_repository.dart';
import '../data_source/search_hotels_remote_data_source.dart';

class SearchHotelsRepositoryImpl extends SearchHotelsRepository {
  final SearchHotelsRemoteDataSource searchHotelsRemoteDataSource;
  final NetworkInfo networkInfo;
  SearchHotelsRepositoryImpl(
      {required this.searchHotelsRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<PrimaryServerException, SearchHotels>> searchHotels(
      dynamic searchOptionsModel) async {
    if (await networkInfo.isConnected) {
      try {
        final locationWeatherModel = await searchHotelsRemoteDataSource
            .searchHotelsInfo(searchOptionsModel);
        return locationWeatherModel;
      } on PrimaryServerException catch (e) {
        //debugPrint(s.toString());
        return Left(e);
      }
    } else {
      return Left(PrimaryServerException(
          code: 500,
          error: 'Connection Failure ',
          message: 'Please Check your Internet Connection'));
    }
  }

  @override
  Future<Either<PrimaryServerException, HotelsData>> getHotels() async{
    return await searchHotelsRemoteDataSource.getHotels();
  }
/*
  @override
  Future<Either<PrimaryServerException, SearchHotels>> searchHotels(SearchOptions searchOptionsModel) async{
    if (await networkInfo.isConnected) {
      try{
        final locationWeatherModel = await searchHotelsRemoteDataSource.searchHotelsInfo(searchOptionsModel);
        return Right(locationWeatherModel);
      }on PrimaryServerException catch (e, s) {
        //debugPrint(s.toString());
        return Left(e);
      }
    }else{
      return Left(PrimaryServerException(code: 500,error: 'Connection Failure ',message: 'Please Check your Internet Connection'));
    }
  }
*/
}
