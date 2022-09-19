import 'package:alo_booking_app/features/authentication/data/models/auth_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';

class LoginUseCase {
  final BaseHomeRepository baseHomeRepository;

  LoginUseCase(this.baseHomeRepository);

  Future<Login> call(AuthModel auth) async {
    return await baseHomeRepository.login(auth);
  }
}
