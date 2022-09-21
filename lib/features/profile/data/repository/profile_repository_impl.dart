import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:alo_booking_app/features/profile/domain/entities/profile.dart';
import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;
  ProfileRepositoryImpl(
      {required this.profileRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<PrimaryServerException, Profile>> getProfileInfo(
      String token) async {
    if (await networkInfo.isConnected) {
      try {
        final profileInfo = await profileRemoteDataSource.getProfileInfo(token);
        return profileInfo;
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
  Future<Either<PrimaryServerException, Profile>> updateProfileInfo(
      String token, dynamic updateProfile) async {
    if (await networkInfo.isConnected) {
      try {
        final profile = await profileRemoteDataSource.updateProfileInfo(
            token, updateProfile);
        return profile;
      } on PrimaryServerException catch (e) {
        // debugPrint(s.toString());
        return Left(e);
      }
    } else {
      return Left(PrimaryServerException(
          code: 500,
          error: 'Connection Failure ',
          message: 'Please Check your Internet Connection'));
    }
  }
}
