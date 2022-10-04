import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/loading_indicator.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/facilities_data.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularFilterWidget extends StatefulWidget {
  const PopularFilterWidget({Key? key}) : super(key: key);
  @override
  State<PopularFilterWidget> createState() => _PopularFilterWidgetState();
}

class _PopularFilterWidgetState extends State<PopularFilterWidget> {
  FacilitiesData? filterComponents;
  late List<bool> selectedComponents;
  List<String> selectedFacilities = [];
  @override
  void initState() {
    selectedComponents =
        List.filled(SearchHotelsBloc.facilities!.data!.length, false);
    selectedFacilities =
        List.filled(SearchHotelsBloc.facilities!.data!.length, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
      builder: (context, state) {
        if (state is GetFacilitiesSuccessState) {
          filterComponents = SearchHotelsBloc.facilities;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular filter',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.accentColor2
                        : AppLightColors.accentColor2,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                filterComponent(),
              ],
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: LoadingIndicator(),
          ),
        );
      },
    );
  }

  filterComponent() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: filterComponents!.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.defaultColor,
              checkColor: AppThemeBloc.get(context).isDarkMode
                  ? AppDarkColors.primaryColor
                  : AppLightColors.primaryColor,
              side: BorderSide(
                width: 2,
                color: AppThemeBloc.get(context).isDarkMode
                    ? AppDarkColors.accentColor1
                    : AppLightColors.accentColor1,
              ),
              value: selectedComponents[index],
              onChanged: (bool? value) {
                setState(
                  () {
                    selectedComponents[index] = value!;
                    if (value == true) {
                      selectedFacilities[index] =
                          filterComponents!.data![index].id.toString();
                    } else {
                      selectedFacilities[index] = '';
                    }
                    SearchHotelsBloc.get(context)
                        .selectFacilities(selectedFacilities);
                  },
                );
              },
            ),
            Text(
              '${filterComponents!.data![index].name}',
            ),
          ],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 5,
      ),
    );
  }
}
