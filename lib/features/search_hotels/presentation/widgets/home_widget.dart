import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_helper.dart';
import '../cubit/search_hotels_cubit.dart';
import '../cubit/search_hotels_state.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseDioHelper? baseDioHelper;
    return BlocConsumer<SearchHotelsBloc, SearchHotelsState>(
      listener: (context, state) {
        if (state is SearchHotelsErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            onPressed: () async {
              // await DioHelper().get(
              //   endPoint: AppApis.profileEndPoint,
              //   token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
              // );
              SearchHotelsBloc.get(context).searchHotels(hotelName: ''
                  // searchOptionsModel: const SearchOptionsModel(
                  //     '', '', '', '', '', '', '', '', '', []
                  // ),
              );
            },
            child: const Text('Filter Button'),
          ),
        );
      },
    );
  }
}
