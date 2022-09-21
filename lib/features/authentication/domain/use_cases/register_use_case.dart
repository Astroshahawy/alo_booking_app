import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/authentication/data/models/register_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends BaseUseCase<Auth, RegisterModel> {
  final BaseAuthRepository baseHomeRepository;

  RegisterUseCase(this.baseHomeRepository);

  @override
  Future<Either<PrimaryServerException, Auth>> call(
      RegisterModel parameters) async {
    return await baseHomeRepository.register(parameters);
  }
}
