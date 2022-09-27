

import 'package:alo_booking_app/features/search_hotels/data/models/hotel_model.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/facilities_data.dart';

import '../../../authentication/data/models/status_model.dart';

class FacilitiesDataModel extends FacilitiesData {
   FacilitiesDataModel({
    required super.status,
    super.data,
    });

  factory FacilitiesDataModel.fromJson(Map<String, dynamic> json) {
    final data = <FacilitiesModel>[];
    json['data'].forEach((v) {
      data.add(FacilitiesModel.fromJson(v));
    });
    return FacilitiesDataModel(
      status: StatusModel.fromJson(json['status']),
      data: data,
    );
  }
}
