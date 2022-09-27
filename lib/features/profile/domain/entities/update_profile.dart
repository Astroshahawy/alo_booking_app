import 'dart:io';

import 'package:equatable/equatable.dart';

class UpdateProfile extends Equatable {
  final String name;
  final String email;
  final File? image;

  const UpdateProfile({
    required this.name,
     this.image,
    required this.email,
  });

  @override
  List<Object?> get props => [name, email, image];
}
