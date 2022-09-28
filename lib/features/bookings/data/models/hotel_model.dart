import 'package:alo_booking_app/features/bookings/domain/entities/hotel.dart';
import 'package:alo_booking_app/features/hotels/data/models/hotel_images_model.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required super.hotelName,
    required super.hotelAddress,
    required super.hotelPrice,
    required super.hotelRate,
    required super.hotelImages,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
      hotelName: json['name'],
      hotelAddress: json['address'],
      hotelPrice: json['price'],
      hotelRate: json['rate'],
      hotelImages: List.from(
          (json['hotel_images'].map((e) => HotelImagesModel.fromJson(e)))),
      );
}
