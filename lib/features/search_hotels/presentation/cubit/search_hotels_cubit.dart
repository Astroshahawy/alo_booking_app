import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/search_hotels/domain/use_cases/get_facilities_use_case.dart';
import 'package:alo_booking_app/features/search_hotels/domain/use_cases/get_hotels_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/search_options_model.dart';
import '../../domain/entities/facilities_data.dart';
import '../../domain/entities/search_hotels.dart';
import '../../domain/use_cases/search_hotel_use_case.dart';
import 'search_hotels_state.dart';

class SearchHotelsBloc extends Cubit<SearchHotelsState> {
  final  SearchHotelsInfo searchHotelsInfo;
  final GetHotelsInfoUseCase getHotelsUseCase;
  final GetFacilitiesInfo getFacilitiesInfo;
  static SearchOptionsModel? searchOptionsModel = SearchOptionsModel(
      '', '', '', '', '', '', '', '', '', {});

  SearchHotelsBloc(
    this.searchHotelsInfo,
      this.getHotelsUseCase,
      this.getFacilitiesInfo,
  ) : super(SearchHotelsInitialState());

  static SearchHotels? searchHotelsList;
  static HotelsData? hotels ;
  static FacilitiesData? facilities;
  static int? hotelsNumber;

  static SearchHotelsBloc get(context) => BlocProvider.of<SearchHotelsBloc>(context);

  void getHotels() async {
    final result = await getHotelsUseCase.call(const NoParameters());
    return result.fold(
          (left) {
        emit(GetHotelsErrorState(exception: left));
      },
          (right) {
            hotelsNumber = right.data.length;
        hotels = right;
        //print(hotels!.data[0].facilities);
        emit(GetHotelsSuccessState());
      },
    );
  }

  void searchHotels({required String hotelName}) async {
    emit(UserSearchHotelsLoadingState());
    final searchFilter = SearchOptionsModel(
        hotelName, searchOptionsModel!.minPrice,
        searchOptionsModel!.address, searchOptionsModel!.maxPrice,
        searchOptionsModel!.latitude, searchOptionsModel!.longitude,
        searchOptionsModel!.distance,  searchOptionsModel!.count,
        searchOptionsModel!.page, searchOptionsModel!.facilities
    );
    final response = await searchHotelsInfo(searchFilter);

    return response.fold(
          (l) {
            print(l.message);
        emit(SearchHotelsErrorState(exception: l));
      },
          (r) {
        //profileModel = r;
            hotelsNumber = r.data!.data.length;
            searchHotelsList = r;
            print(r.data!.data.length);
        emit(UserSearchHotelsSuccessState());
      },
    );
  }

  searchFilter({SearchOptionsModel? searchOptions}){
    searchOptionsModel = searchOptions;
    emit(state);
  }

  static List<String> selectedFacilities = [];
  selectFacilities(List<String> facilities){
    print(facilities);
      selectedFacilities = facilities;
  }

  getFacilities() async{
    final response = await getFacilitiesInfo.call(const NoParameters());

    return response.fold(
          (l) {
        print(l.message);
        emit(SearchHotelsErrorState(exception: l));
      }, (r) {
        facilities = r;
        print(r.data!.length);
        emit(GetFacilitiesSuccessState(r));
      },
    );
  }

  static bool searchMap = false;
  changeSearchMap(){
    searchMap = !searchMap;
    print(searchMap);
  }
}
