

import 'package:alo_booking_app/features/search_hotels/domain/entities/hotel.dart';
import 'package:equatable/equatable.dart';

import '../../../authentication/domain/entities/status.dart';

class FacilitiesData extends Equatable {

  final Status status;
  final List<Facilities>? data;

  const FacilitiesData({
    required this.status,
    this.data,
  });


  @override
  List<Object?> get props => [];


}