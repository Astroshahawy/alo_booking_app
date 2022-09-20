import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.email,
    required super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
