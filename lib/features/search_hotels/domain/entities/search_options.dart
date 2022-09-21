

import 'package:equatable/equatable.dart';

class SearchOptions extends Equatable {
  String name;
  String minPrice;
  String address;
  String maxPrice;
  String latitude;
  String longitude;
  String distance;
  String count;
  String page;
  List<String> facilities;

  SearchOptions(
      this.name,
      this.minPrice,
      this.address,
      this.maxPrice,
      this.latitude,
      this.longitude,
      this.distance,
      this.count,
      this.page,
      this.facilities);

  @override
  List<Object?> get props => [name, address, minPrice, maxPrice,longitude,latitude,distance, count,page,facilities];
}