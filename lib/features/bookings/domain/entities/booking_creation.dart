import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/features/authentication/domain/entities/status.dart';

class BookingCreation extends Equatable {
  final Status status;

  const BookingCreation({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}
