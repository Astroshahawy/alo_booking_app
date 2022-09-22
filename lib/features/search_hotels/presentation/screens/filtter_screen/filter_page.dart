import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_screen/widgets/distance_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_screen/widgets/range_slider_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_screen/widgets/type_accommodation_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_widget.dart';
import 'widgets/popular_filter_widget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.close)),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Filtter',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
              ),
              const SizedBox(height: 8,),
              RangeSliderWidget(),
              const SizedBox(height: 12,),
              PopularFilterWidget(),
              const SizedBox(height: 12,),
              DistanceWidget(),
              const SizedBox(height: 10,),
              TypeAccommodationWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
