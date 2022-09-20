
import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/profile/domain/entities/profile.dart';

import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileInfo {
  final ProfileRepository profileRepository;

  GetProfileInfo({required this.profileRepository});

  Future<Either<PrimaryServerException, Profile>> call(String token) async {
    return await profileRepository.getProfileInfo(token);
  }
}
