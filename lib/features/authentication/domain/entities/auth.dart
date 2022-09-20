import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/features/authentication/domain/entities/status.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/user.dart';

class Auth extends Equatable {
  final Status status;
  final User userData;

  const Auth({
    required this.status,
    required this.userData,
  });

  @override
  List<Object> get props => [status, userData];
}
