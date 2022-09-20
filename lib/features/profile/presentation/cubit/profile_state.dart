import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserProfileSuccessState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  final PrimaryServerException exception;

  ProfileErrorState({
    required this.exception,
  });

  @override
  List<Object> get props => [exception];
}
