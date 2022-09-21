import 'package:equatable/equatable.dart';

class HotelImages extends Equatable {
  final String image;
  final String hotelId;
  final int id;

  const HotelImages(
      {required this.image, required this.hotelId, required this.id});

  @override
  List<Object> get props => [image, hotelId, id];

}