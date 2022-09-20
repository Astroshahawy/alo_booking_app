
import 'package:alo_booking_app/features/authentication/domain/entities/status.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';


class Profile extends Equatable {
  Status status;
  User data;

  Profile({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}