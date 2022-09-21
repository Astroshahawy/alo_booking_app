import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/use_case/base_use_case.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/domain/use_cases/get_hotels_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;
  HotelsCubit(this.getHotelsUseCase) : super(HotelsInitial());
  List<Hotels> hotels = [];
  void getHotels() async {
    final result = await getHotelsUseCase.call(const NoParameters());
    result.fold(
      (left) {
        emit(GetHotelsErrorState(exception: left));
      },
      (right) {
        hotels = right.hotels;
        print(hotels.length);
        emit(GetHotelsSuccessState());
      },
    );
  }
}
