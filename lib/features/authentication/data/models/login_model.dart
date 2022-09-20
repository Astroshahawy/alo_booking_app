import 'package:alo_booking_app/features/authentication/data/models/status_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/user_model.dart';
import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.status,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}
