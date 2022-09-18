import 'package:alo_booking_app/features/feature/data/models/auth_model.dart';
import 'package:alo_booking_app/features/feature/data/repository/home_repository.dart';
import 'package:alo_booking_app/features/feature/domain/entities/Login.dart';
import 'package:alo_booking_app/features/feature/domain/repository/base_home_repository.dart';

class LoginUseCase {
  final BaseHomeRepository baseHomeRepository;

  LoginUseCase(this.baseHomeRepository);

  Future<Login> call(AuthModel auth) async {
    return await baseHomeRepository.login(auth);
  }
}
