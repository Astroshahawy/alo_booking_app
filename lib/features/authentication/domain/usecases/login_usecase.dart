import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final BaseHomeRepository baseHomeRepository;

  LoginUseCase(this.baseHomeRepository);

  Future<Either<PrimaryServerException, Login>> call(Auth auth) async {
    return await baseHomeRepository.login(auth);
  }
}
