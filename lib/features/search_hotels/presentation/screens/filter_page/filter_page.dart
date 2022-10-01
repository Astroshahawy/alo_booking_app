import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/loading_indicator.dart';
import 'package:alo_booking_app/features/profile/presentation/widgets/divider_widget.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/search_options_model.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/distance_widget.dart';
import 'widgets/popular_filter_widget.dart';
import 'widgets/range_slider_widget.dart';
import 'widgets/type_accommodation_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key, required this.searchText});
  final String searchText;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final minPrice = TextEditingController();
  final maxPrice = TextEditingController();

  @override
  void initState() {
    final bloc = SearchHotelsBloc.get(context);
    bloc.getFacilities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 68,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text(
              'Filter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        RangeSliderWidget(
                          minPriceController: minPrice,
                          maxPriceController: maxPrice,
                        ),
                        const DividerWidget(),
                        const SizedBox(height: 10),
                        SearchHotelsBloc.facilities != null
                            ? const PopularFilterWidget()
                            : const Center(child: LoadingIndicator()),
                        const DividerWidget(),
                        const SizedBox(height: 10),
                        const DistanceWidget(),
                        const DividerWidget(),
                        const SizedBox(height: 10),
                        const DividerWidget(),
                        const SizedBox(height: 10),
                        const TypeAccommodationWidget(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const DividerWidget(),
          BouncingButton(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            onPress: () {
              SearchHotelsBloc.get(context).searchFilter(
                searchOptions: SearchOptionsModel(
                  widget.searchText,
                  minPrice.text,
                  '',
                  maxPrice.text,
                  '',
                  '',
                  '',
                  '',
                  '',
                  {
                    ...SearchHotelsBloc.selectedFacilities.asMap().map(
                          (key, value) => MapEntry(
                            'facilities[$key]',
                            value,
                          ),
                        ),
                  },
                ),
              );
              SearchHotelsBloc.get(context)
                  .searchHotels(hotelName: widget.searchText);
              Navigator.pop(context);
            },
            child: const Text(
              'Apply',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
