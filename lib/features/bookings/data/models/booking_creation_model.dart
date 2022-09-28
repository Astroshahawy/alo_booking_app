import 'package:alo_booking_app/features/authentication/data/models/status_model.dart';
import 'package:alo_booking_app/features/bookings/domain/entities/booking_creation.dart';

class BookingCreationModel extends BookingCreation {
  const BookingCreationModel({
    required super.status,
  });
  factory BookingCreationModel.fromJson(Map<String, dynamic> json) {
    return BookingCreationModel(
      status: StatusModel.fromJson(json['status']),
    );
  }
}
