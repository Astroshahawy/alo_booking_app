import 'package:alo_booking_app/features/hotels/data/models/hotels_model.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels_data.dart';

class HotelsDataModel extends HotelData {
  const HotelsDataModel({required super.currentPage, required super.hotels});
  factory HotelsDataModel.fromJson(Map<String, dynamic> json) =>
      HotelsDataModel(
          currentPage: json['current_page'],
          hotels: List.from(json['data'].map((e) => HotelsModel.fromJson(e))));
}
