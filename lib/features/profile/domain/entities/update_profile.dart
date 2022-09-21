import 'package:equatable/equatable.dart';

class UpdateProfile extends Equatable {
  String name;
  String email;
  String image;

  UpdateProfile({
    required this.name,
    required this.image,
    required this.email,
  });

  @override
  List<Object?> get props => [name, email, image];
}
