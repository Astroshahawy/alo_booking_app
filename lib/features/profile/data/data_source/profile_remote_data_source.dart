import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/profile/data/models/profile_model.dart';
import 'package:alo_booking_app/features/profile/data/models/update_profile_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<PrimaryServerException, ProfileModel>> getProfileInfo(
      String token);
  Future<Either<PrimaryServerException, ProfileModel>> updateProfileInfo(
      String token, UpdateProfileModel updateProfile);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  ProfileRemoteDataSourceImpl(this.baseDioHelper);

  @override
  Future<Either<PrimaryServerException, ProfileModel>> getProfileInfo(
      String token) async {
    return basicErrorHandling(
      onSuccess: () async {
        final response = await baseDioHelper.get(
          endPoint: AppApis.profileEndPoint,
          token: token,
        );
        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, ProfileModel>> updateProfileInfo(
      String token, UpdateProfileModel updateProfile) async {
    return basicErrorHandling(
      onSuccess: () async {
        final response = await baseDioHelper.post(
          endPoint: AppApis.updateProfileEndPoint,
          token: token,
          data: updateProfile.toJson(),
        );
        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on ProfileRemoteDataSource {
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
