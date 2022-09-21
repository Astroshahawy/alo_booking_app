import 'package:alo_booking_app/features/hotels/domian/entities/hotel_facilites.dart';

class HotelFacilitesModel extends HotelFacilites {
  HotelFacilitesModel(
      {required super.facilityId, required super.hotelId, required super.id});
  factory HotelFacilitesModel.fromJson(Map<String, dynamic> json) =>
      HotelFacilitesModel(
          facilityId: json['facility_id'],
          hotelId: json['hotel_id'],
          id: json['id']);
}
