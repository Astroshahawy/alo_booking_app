import 'package:alo_booking_app/features/hotels/data/models/hotel_facilities_model.dart';
import 'package:alo_booking_app/features/hotels/data/models/hotel_images_model.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';

class HotelsModel extends Hotels {
  const HotelsModel(
      {required super.hotelName,
      required super.hotelAddress,
      required super.hotelId,
      required super.hotelPrice,
      required super.hotelRate,
      required super.hotelImages,
      required super.hotelDescription,
      required super.hotelFacilites});
  factory HotelsModel.fromJson(Map<String, dynamic> json) => HotelsModel(
      hotelName: json['name'],
      hotelAddress: json['address'],
      hotelPrice: json['price'],
      hotelId: json['id'],
      hotelRate: json['rate'],
      hotelDescription: json['description'],
      hotelImages: List.from(
          (json['hotel_images'].map((e) => HotelImagesModel.fromJson(e)))),
      hotelFacilites: List.from((json['hotel_facilities']
          .map((e) => HotelFacilitiesModel.fromJson(e)))));
}
