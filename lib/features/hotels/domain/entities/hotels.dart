import 'package:equatable/equatable.dart';

import 'hotel_facilities.dart';
import 'hotel_images.dart';

class Hotels extends Equatable {
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;
  final String hotelRate;
  final String hotelDescription;
  final List<HotelImages> hotelImages;
  final List<HotelFacilities> hotelFacilites;

  const Hotels(
      {required this.hotelName,
      required this.hotelAddress,
      required this.hotelPrice,
      required this.hotelRate,
      required this.hotelImages,
      required this.hotelDescription,
      required this.hotelFacilites});

  @override
  List<Object> get props => [
        hotelName,
        hotelAddress,
        hotelPrice,
        hotelRate,
        hotelImages,
        hotelFacilites,
        hotelDescription
      ];
}
