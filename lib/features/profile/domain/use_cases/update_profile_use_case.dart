import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../entities/profile.dart';
import '../repository/profile_repository.dart';

class UpdateProfileInfo
    extends BaseUseCase<Profile, UpdateProfileInfoParameters> {
  final ProfileRepository updateProfileRepository;

  UpdateProfileInfo({required this.updateProfileRepository});

  @override
  Future<Either<PrimaryServerException, Profile>> call(
      UpdateProfileInfoParameters parameters) async {
    return await updateProfileRepository.updateProfileInfo(
      parameters.token,
      parameters.updateProfile,
    );
  }
}

class UpdateProfileInfoParameters extends Equatable {
  final String token;
  final UpdateProfile updateProfile;

  const UpdateProfileInfoParameters({
    required this.token,
    required this.updateProfile,
  });

  @override
  List<Object> get props => [token, updateProfile];
}
