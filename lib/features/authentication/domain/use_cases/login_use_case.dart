import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<Auth, LoginModel> {
  final BaseAuthRepository baseHomeRepository;

  LoginUseCase(this.baseHomeRepository);

  @override
  Future<Either<PrimaryServerException, Auth>> call(
      LoginModel parameters) async {
    return await baseHomeRepository.login(parameters);
  }
}
