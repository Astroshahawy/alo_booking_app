import 'package:alo_booking_app/features/search_hotels/domain/entities/search_hotels.dart';
import '../../../authentication/data/models/status_model.dart';
import 'hotels_data_model.dart';

class SearchHotelsModel extends SearchHotels {
  const SearchHotelsModel({
    required super.status,
    super.data,
  });

  factory SearchHotelsModel.fromJson(Map<String, dynamic> json) {
    return SearchHotelsModel(
      status: StatusModel.fromJson(json['status']),
      data: HotelsDataModel.fromJson(json['data']),
    );
  }
}
