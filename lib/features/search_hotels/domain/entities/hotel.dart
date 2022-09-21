

import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;

  Hotel(
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
  int? id;
  String? hotelId;
  String? image;
  String? createdAt;
  String? updatedAt;

  HotelImages(
  {this.id, this.hotelId, this.image, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, hotelId, image, createdAt, updatedAt];


}

class Facilities extends Equatable {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Facilities({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, name, image, createdAt, updatedAt];
}