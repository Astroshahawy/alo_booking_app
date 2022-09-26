import '../../domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
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
    final List<HotelImagesModel> hotelImagesList = [];
    json['hotel_images'].forEach((v) {
      hotelImagesList.add(HotelImagesModel.fromJson(v));
    });
    final List<FacilitiesModel> facilitiesList = [];
    if( json['facilities'] != null){
      json['facilities'].forEach((v) {
        facilitiesList.add(FacilitiesModel.fromJson(v));
      });
    }else{
      json['hotel_facilities'].forEach((v) {
        facilitiesList.add(FacilitiesModel.fromJson(v));
      });
    }

    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      facilities: facilitiesList,
      hotelImages: hotelImagesList,
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
      'hotel_images':
          hotelImages!.map((v) => const HotelImagesModel().toJson()).toList(),
      'facilities':
          facilities!.map((v) => const HotelImagesModel().toJson()).toList(),
    };
  }
}

class HotelImagesModel extends HotelImages {
  const HotelImagesModel({
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
  const FacilitiesModel({
    super.id,
    super.hotelId,
    super.facilityId,
    super.name,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) {
    return FacilitiesModel(
      id: json['id'],
      hotelId : json['hotel_id'] != null ? json['hotel_id'] : '',
      facilityId : json['facility_id'] != null ? json['facility_id'] : '',
      name: json['name'] != null ? json['name'] : '',
      image: json['image'] != null ? json['image'] : '',
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
