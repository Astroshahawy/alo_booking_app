import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;
  final String image;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, name, email, token, image, createdAt, updatedAt];
}
