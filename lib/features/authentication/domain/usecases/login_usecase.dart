import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/usecase/base_usecase.dart';

import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<Auth, Login> {
  final BaseAuthRepository baseHomeRepository;

  LoginUseCase(this.baseHomeRepository);

  @override
  Future<Either<PrimaryServerException, Auth>> call(Login parameters) async {
    return await baseHomeRepository.login(parameters);
  }
}
