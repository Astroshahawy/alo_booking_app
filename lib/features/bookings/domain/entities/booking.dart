import 'package:alo_booking_app/features/bookings/domain/entities/hotel.dart';
import 'package:equatable/equatable.dart';

import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';

class Booking extends Equatable {
  final int id;
  final String userId;
  final String hotelId;
  final String type;
  final String createdAt;
  final String updatedAt;
  final Hotel hotelData;

  const Booking({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelData,
  });

  @override
  List<Object> get props {
    return [
      id,
      userId,
      hotelId,
      type,
      createdAt,
      updatedAt,
      hotelData,
    ];
  }
}
