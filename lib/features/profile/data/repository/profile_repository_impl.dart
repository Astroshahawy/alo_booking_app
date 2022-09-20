

import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:alo_booking_app/features/profile/domain/entities/profile.dart';
import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;
  ProfileRepositoryImpl({required this.profileRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<PrimaryServerException, Profile>> getProfileInfo(String token) async{

    if (await networkInfo.isConnected) {
      try{
        final locationWeatherModel = await profileRemoteDataSource.getProfileInfo(token);
        return Right(locationWeatherModel);
      }on PrimaryServerException catch (e, s) {
        //debugPrint(s.toString());
        return Left(e);
      }
    }else{
      return Left(PrimaryServerException(code: 500,error: 'Connection Failure ',message: 'Please Check your Internet Connection'));
    }
  }

}
