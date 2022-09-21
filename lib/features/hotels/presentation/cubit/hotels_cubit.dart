import 'package:alo_booking_app/core/exceptions/exceptions.dart';
import 'package:alo_booking_app/core/usecase/base_usecase.dart';
import 'package:alo_booking_app/features/hotels/domian/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/domian/use_cases/get_hotels_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../authentication/presentation/cubit/booking_state.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;
  HotelsCubit(this.getHotelsUseCase) : super(HotelsInitial());
  List<Hotels>hotels=[];
void getHotels()async{
  final result=await getHotelsUseCase.call(const NoParameters());
  result.fold(
        (left) {
      emit(GetHotelsErrorState(exception:left));
    },
        (right) {
      hotels = right.hotels;
      print(hotels.length);
      emit(GetHotelsSucessState());
    },
  );
}

}
