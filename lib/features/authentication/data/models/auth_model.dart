import 'package:alo_booking_app/features/authentication/data/models/status_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/user_model.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required super.status,
    required super.userData,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: StatusModel.fromJson(json['status']),
      userData: UserModel.fromJson(json['data']),
    );
  }
}
