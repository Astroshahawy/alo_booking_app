import 'package:alo_booking_app/features/hotels/domain/entities/hotel_images.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final String hotelName;
  final String hotelAddress;
  final String hotelPrice;
  final String hotelRate;
  final List<HotelImages> hotelImages;

  const Hotel({
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelPrice,
    required this.hotelRate,
    required this.hotelImages,
  });

  @override
  List<Object> get props => [
        hotelName,
        hotelAddress,
        hotelPrice,
        hotelRate,
        hotelImages,
      ];
}
