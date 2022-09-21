import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/search_options_model.dart';
import '../../domain/use_cases/profile_use_case.dart';
import 'search_hotels_state.dart';

class SearchHotelsBloc extends Cubit<SearchHotelsState> {
  final  SearchHotelsInfo searchHotelsInfo;

  SearchHotelsBloc(
    this.searchHotelsInfo,
  ) : super(SearchHotelsInitialState());

  static SearchHotelsBloc get(context) => BlocProvider.of<SearchHotelsBloc>(context);

  void searchHotels({SearchOptionsModel? searchOptionsModel}) async {
    emit(UserSearchHotelsLoadingState());

    final response = await searchHotelsInfo(searchOptionsModel!);

    return response.fold(
          (l) {
            print(l.message);
        emit(SearchHotelsErrorState(exception: l));
      },
          (r) {
        //profileModel = r;
            print(r);
        emit(UserSearchHotelsSuccessState());
      },
    );
  }
}
