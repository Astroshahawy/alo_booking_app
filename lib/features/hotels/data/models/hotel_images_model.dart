import 'package:alo_booking_app/features/hotels/domian/entities/hotel_images.dart';

class HotelImagesModel extends HotelImages {
  HotelImagesModel(
      {required super.image, required super.hotelId, required super.id});
  factory HotelImagesModel.fromJson(Map<String, dynamic> json) =>
      HotelImagesModel(
          image: json['image'], hotelId: json['hotel_id'], id: json['id']);
}
