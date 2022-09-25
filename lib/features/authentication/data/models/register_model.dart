import 'package:alo_booking_app/features/authentication/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.name,
    required super.email,
    required super.password,
    required super.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      passwordConfirmation: json['password_confirmation'] ?? '',
    );
  }
}
