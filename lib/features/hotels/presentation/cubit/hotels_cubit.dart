import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/domain/use_cases/get_hotels_use_case.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;
  HotelsCubit(this.getHotelsUseCase) : super(HotelsInitial());
  List<Hotels> hotels = [];
  List<String> images = [];
  List<String> hotelNames = [];

  void getHotels() async {
    emit(GetHotelsLoadingState());
    final result = await getHotelsUseCase.call(const NoParameters());
    result.fold(
      (left) {
        emit(GetHotelsErrorState(exception: left));
      },
      (right) {
        getHotelsImages(right.hotels);
        hotels = right.hotels;

        print(hotels.length);
        print(images.length);
        emit(GetHotelsSuccessState());
      },
    );
  }

  void getHotelsImages(List<Hotels> hotels) {
    for (int i = 0; i < hotels.length; i++) {
      hotelNames.add(hotels[i].hotelName);
      images.add(hotels[i].hotelImages[2].image);
    }
  }
}
