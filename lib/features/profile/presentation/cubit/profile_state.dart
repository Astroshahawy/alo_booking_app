import 'dart:io';

import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class UserProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class UserProfileSuccessState extends ProfileState {
  User user;

  UserProfileSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileErrorState extends ProfileState {
  final PrimaryServerException exception;

  const ProfileErrorState({
    required this.exception,
  });

  @override
  List<Object> get props => [exception];
}

class ImageUploadingState extends ProfileState {

  @override
  List<Object> get props => [];
}

class ImageUploadedState extends ProfileState {
  File image;

  ImageUploadedState(this.image);

  @override
  List<Object> get props => [image];
}
