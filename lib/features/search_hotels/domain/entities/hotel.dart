import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? rate;
  final String? createdAt;
  final String? updatedAt;
  final List<HotelImages>? hotelImages;
  final List<Facilities>? facilities;

  const Hotel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.createdAt,
      this.updatedAt,
      this.hotelImages,
      this.facilities});

  @override
  List<Object> get props => [];
}

class HotelImages extends Equatable {
  final int? id;
  final String? hotelId;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  const HotelImages(
      {this.id, this.hotelId, this.image, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, hotelId, image, createdAt, updatedAt];
}

class Facilities extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  const Facilities(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, name, image, createdAt, updatedAt];
}
