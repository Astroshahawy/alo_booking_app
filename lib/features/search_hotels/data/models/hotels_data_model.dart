import 'package:alo_booking_app/features/search_hotels/data/models/hotel_model.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';

class HotelsDataModel extends HotelsData {
  const HotelsDataModel({
    required super.data,
  });

  factory HotelsDataModel.fromJson(Map<String, dynamic> json) {
    //debugPrint(json.toString());
    return HotelsDataModel(
      data: List<HotelModel>.from(
        json['data'].map(
          (x) => HotelModel.fromJson(x),
        ),
      ),
    );
  }
}
