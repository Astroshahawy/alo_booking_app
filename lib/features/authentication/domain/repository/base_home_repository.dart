import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHomeRepository {
  Future<Either<PrimaryServerException, Login>> login(Auth auth);
}
