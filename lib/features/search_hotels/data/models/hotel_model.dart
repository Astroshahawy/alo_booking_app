
import '../../domain/entities/hotel.dart';

class HotelModel extends Hotel {
  HotelModel({
    super.id,
    super.name,
    super.address,
    super.description,
    super.price,
    super.rate,
    super.longitude,
    super.latitude,
    super.createdAt,
    super.hotelImages,
    super.facilities,
    super.updatedAt,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final List<HotelImagesModel> hotelImageslist = [];
    json['hotel_images'].forEach((v) {
      hotelImageslist.add(new HotelImagesModel.fromJson(v));
    });
    final List<FacilitiesModel> facilitieslist = [];
    json['facilities'].forEach((v) {
      facilitieslist.add(new FacilitiesModel.fromJson(v));
    });

    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      facilities: facilitieslist,
      hotelImages: hotelImageslist,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'rate': rate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'hotel_images': hotelImages!.map((v) => HotelImagesModel().toJson()).toList(),
      'facilities': facilities!.map((v) => HotelImagesModel().toJson()).toList(),
    };
  }
}

class HotelImagesModel extends HotelImages {
  HotelImagesModel({
    super.id,
    super.hotelId,
    super.image,
    super.updatedAt,
    super.createdAt,
  });

  factory HotelImagesModel.fromJson(Map<String, dynamic> json) {
    return HotelImagesModel(
      id: json['id'],
      hotelId: json['hotel_id'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotel_id': hotelId,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class FacilitiesModel extends Facilities {
  FacilitiesModel({
    super.id,
    super.name,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) {
    return FacilitiesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
