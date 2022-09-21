import 'package:alo_booking_app/features/hotels/domian/entities/hotels.dart';
import 'package:equatable/equatable.dart';

class HotelData extends Equatable {
  final int currentPage;
  final List<Hotels>hotels;

  const HotelData({ required this.currentPage, required this.hotels});

  @override
  List<Object> get props => [currentPage, hotels];
}







