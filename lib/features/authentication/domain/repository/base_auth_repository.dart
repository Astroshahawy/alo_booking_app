import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<PrimaryServerException, Auth>> login(Login login);
  Future<Either<PrimaryServerException, Auth>> register(Register register);
}
