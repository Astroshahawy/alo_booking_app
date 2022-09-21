
import 'package:alo_booking_app/features/authentication/domain/entities/status.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:equatable/equatable.dart';



class SearchHotels extends Equatable {
  Status status;
  HotelsData? data;

  SearchHotels({
    required this.status,
    this.data,
  });

  @override
  List<Object> get props => [status, data!];
}