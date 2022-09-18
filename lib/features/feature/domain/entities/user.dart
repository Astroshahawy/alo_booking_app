import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String token;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
  });

  @override
  List<Object> get props => [id, token, name, email];
}
