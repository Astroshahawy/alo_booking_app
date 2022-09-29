import 'package:alo_booking_app/features/bookings/data/models/hotel_model.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.userId,
    required super.hotelId,
    required super.type,
    required super.createdAt,
    required super.updatedAt,
    required super.hotelData,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'].toInt(),
      userId: json['user_id'],
      hotelId: json['hotel_id'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      hotelData: HotelModel.fromJson(json['hotel']),
    );
  }
}
