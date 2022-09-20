
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/profile/data/models/profile_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileInfo(String token);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  ProfileRemoteDataSourceImpl(this.baseDioHelper);

  @override
  Future<ProfileModel> getProfileInfo(String token) async{
    final response = await baseDioHelper.get(
      endPoint: AppApis.profileEndPoint,
      token: token,
    );
    return ProfileModel.fromJson(response);

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
    } on PrimaryServerException catch (e, s) {
      //debugPrint(s.toString());
      return Left(e);
    }
  }
}
