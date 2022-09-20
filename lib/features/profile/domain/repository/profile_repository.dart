import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<PrimaryServerException, Profile>> getProfileInfo(String token);
}
