

import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../entities/profile.dart';
import '../repository/profile_repository.dart';

class UpdateProfileInfo {
  final ProfileRepository updateProfileRepository;

  UpdateProfileInfo({required this.updateProfileRepository});

  Future<Either<PrimaryServerException, Profile>> call(String token, UpdateProfile updateProfile) async {
    return await updateProfileRepository.updateProfileInfo(token,updateProfile);
  }

}
