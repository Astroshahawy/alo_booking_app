


import '../../../authentication/data/models/status_model.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.status,
    required super.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}