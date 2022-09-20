import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/register_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<PrimaryServerException, Auth>> login(LoginModel loginModel);
  Future<Either<PrimaryServerException, Auth>> register(
      RegisterModel registerModel);
}
