import 'package:alo_booking_app/features/hotels/domain/entities/hotel_facilities.dart';

class HotelFacilitiesModel extends HotelFacilities {
  const HotelFacilitiesModel(
      {required super.facilityId, required super.hotelId, required super.id});
  factory HotelFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      HotelFacilitiesModel(
          facilityId: json['facility_id'],
          hotelId: json['hotel_id'],
          id: json['id']);
}
