import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
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
  FilterPage({super.key, required this.searchText});
  String searchText;
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
      body: BlocBuilder<SearchHotelsBloc,SearchHotelsState>(
        builder: (context, state) {
        if(state is GetFacilitiesSuccessState){
          return SingleChildScrollView(
            child: Container(
              height: size.height,
              color: AppColors.baseColor,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.86,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close)),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Filtter',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RangeSliderWidget(
                              minPriceController: minPrice,
                              maxPriceController: maxPrice),
                          const SizedBox(
                            height: 12,
                          ),
                          PopularFilterWidget(),
                          const SizedBox(
                            height: 12,
                          ),
                          DistanceWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          TypeAccommodationWidget(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dividerWidget(0, 0, 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10
                            ),
                            child: BouncingButton(
                              height: 50,
                              onPress: () {
                                //print(SearchHotelsBloc.selectedFacilities..asMap());
                                SearchHotelsBloc.get(context).searchFilter(
                                  searchOptions: SearchOptionsModel(widget.searchText, minPrice.text, '', maxPrice.text,
                                      '', '', '', '', '', {
                                        ...SearchHotelsBloc.selectedFacilities.asMap().map(
                                              (key, value) => MapEntry(
                                            'facilities[$key]',
                                            value,
                                          ),
                                        ),
                                      },

                                  ),
                                  /*SearchOptionsModel(
                                      '', minPrice.text,
                                      '', maxPrice.text, '', '', '', '', '', SearchHotelsBloc.selectedFacilities
                                  ),*/
                                );
                                // widget.searchText.isNotEmpty ?
                                SearchHotelsBloc.get(context).searchHotels(hotelName:widget.searchText) ;
                                // : null;
                                Navigator.pop(context);

                              },
                              child: Text('Apply'),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },),
    );
  }
}
