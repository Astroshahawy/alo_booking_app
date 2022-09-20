import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/usecase/base_usecase.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends BaseUseCase<Auth, Register> {
  final BaseAuthRepository baseHomeRepository;

  RegisterUseCase(this.baseHomeRepository);

  @override
  Future<Either<PrimaryServerException, Auth>> call(Register parameters) async {
    return await baseHomeRepository.register(parameters);
  }
}
