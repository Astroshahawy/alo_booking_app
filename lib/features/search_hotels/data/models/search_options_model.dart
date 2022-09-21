

import 'package:alo_booking_app/features/search_hotels/domain/entities/search_options.dart';

class SearchOptionsModel extends SearchOptions {
  SearchOptionsModel(
      super.name,
      super.minPrice,
      super.address,
      super.maxPrice,
      super.latitude,
      super.longitude,
      super.distance,
      super.count,
      super.page,
      super.facilities,);

  Map<String, dynamic> toJson() {
    return {
      'min_price': minPrice,
      'name': name,
      'max_price': maxPrice,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'longitude': longitude,
      'count': count,
      'page': page,
      'facilities': facilities,
    };
  }
}