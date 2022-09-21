import 'package:equatable/equatable.dart';

class UpdateProfile extends Equatable {
  final String name;
  final String email;
  final String image;

  const UpdateProfile({
    required this.name,
    required this.image,
    required this.email,
  });

  @override
  List<Object?> get props => [name, email, image];
}
