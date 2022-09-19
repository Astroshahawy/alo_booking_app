import 'package:alo_booking_app/features/authentication/data/models/auth_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';

abstract class BaseHomeRepository {
  Future<Login> login(AuthModel auth);
}
