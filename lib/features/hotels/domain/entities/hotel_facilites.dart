import 'package:equatable/equatable.dart';

class HotelFacilites extends Equatable {
  final String facilityId;
  final String hotelId;
  final int id;

  const HotelFacilites(
      {required this.facilityId, required this.hotelId, required this.id});

  @override
  List<Object> get props => [facilityId, hotelId, id];
}