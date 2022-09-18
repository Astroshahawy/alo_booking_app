import 'package:alo_booking_app/features/feature/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.token,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['api_token'],
      name: json['name'],
      email: json['email'],
    );
  }
}
