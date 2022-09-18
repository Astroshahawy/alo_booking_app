import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/features/feature/domain/entities/status.dart';
import 'package:alo_booking_app/features/feature/domain/entities/user.dart';

class Login extends Equatable {
  final Status status;
  final User data;

  const Login({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
