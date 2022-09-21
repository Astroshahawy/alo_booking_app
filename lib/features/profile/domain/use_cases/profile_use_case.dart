import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/profile/domain/entities/profile.dart';

import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileInfo extends BaseUseCase<Profile, String> {
  final ProfileRepository profileRepository;

  GetProfileInfo({required this.profileRepository});

  @override
  Future<Either<PrimaryServerException, Profile>> call(String parameters) async {
    return await profileRepository.getProfileInfo(parameters);
  }
}
