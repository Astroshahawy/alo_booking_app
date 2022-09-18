import 'package:alo_booking_app/features/feature/data/models/auth_model.dart';
import 'package:alo_booking_app/features/feature/domain/entities/Login.dart';

abstract class BaseHomeRepository {
  Future<Login> login(AuthModel auth);
}
