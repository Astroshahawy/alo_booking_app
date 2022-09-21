

import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';

class UpdateProfileModel extends UpdateProfile {

  UpdateProfileModel({required super.name, required super.image, required super.email});

/*
  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      name: json['name'],
        email: json['email'],
        image: json['image'],
    );

  }
*/

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }

}