import 'package:alo_booking_app/core/exceptions/exceptions.dart';
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
  @override
  List<Object?> get props => [];
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

  @override
  List<Object> get props => [];
}
