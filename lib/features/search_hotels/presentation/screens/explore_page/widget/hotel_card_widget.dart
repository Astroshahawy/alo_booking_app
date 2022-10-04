import 'dart:math';

import 'package:alo_booking_app/features/bookings/presentation/widgets/slide_fade_animation.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/hotel_review_full_box.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../../cubit/search_hotels_state.dart';

class HotelCardWidget extends StatefulWidget {
  const HotelCardWidget({Key? key, required this.searchHotels})
      : super(key: key);
  final List<Hotel> searchHotels;
  @override
  State<HotelCardWidget> createState() => _HotelCardWidgetState();
}

class _HotelCardWidgetState extends State<HotelCardWidget> {
  @override
  Widget build(BuildContext context) {
    final hotelsList = widget.searchHotels;
    return BlocConsumer<SearchHotelsBloc, SearchHotelsState>(
      listener: (context, state) {
        if (state is SearchHotelsErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          itemCount: hotelsList.length,
          itemBuilder: (context, index) {
            final hotel = hotelsList[index];
            return SlideFadeAnimation(
              index: index,
              animationDuration: 1000,
              verticalOffset: 200,
              child: HotelReviewFullBox(
                name: hotel.name!,
                address: hotel.address!,
                price: hotel.price!,
                rating: hotel.rate!,
                coverImage: AppApis.getImageUrl(
                  hotel
                      .hotelImages![Random().nextInt(hotel.hotelImages!.length)]
                      .image!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
