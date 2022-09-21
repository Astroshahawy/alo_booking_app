import 'package:equatable/equatable.dart';

class SearchOptions extends Equatable {
  final String name;
  final String minPrice;
  final String address;
  final String maxPrice;
  final String latitude;
  final String longitude;
  final String distance;
  final String count;
  final String page;
  final List<String> facilities;

  const SearchOptions(
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
  List<Object?> get props => [
        name,
        address,
        minPrice,
        maxPrice,
        longitude,
        latitude,
        distance,
        count,
        page,
        facilities
      ];
}
