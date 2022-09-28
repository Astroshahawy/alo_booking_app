import 'dart:math';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_cubit.dart';
import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_state.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/slide_fade_animation.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/hotel_review_full_box.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingBookingsPage extends StatefulWidget {
  const UpcomingBookingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingBookingsPage> createState() => _UpcomingBookingsPageState();
}

class _UpcomingBookingsPageState extends State<UpcomingBookingsPage>
    with AutomaticKeepAliveClientMixin<UpcomingBookingsPage> {
  @override
  void initState() {
    super.initState();
    BookingsBloc.get(context).getUpcomingBookings(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BookingsBloc, BookingsState>(
      buildWhen: (previous, current) => current is UpcomingBookingsLoadedState,
      builder: (context, state) {
        if (state is UpcomingBookingsLoadingState) {
          return const LoadingIndicator();
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: BookingsBloc.get(context).upcomingBookings.length,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          itemBuilder: (context, index) {
            final hotel =
                BookingsBloc.get(context).upcomingBookings[index].hotelData;
            return SlideFadeAnimation(
              index: index,
              animationDuration: 1000,
              verticalOffset: 200,
              child: HotelReviewFullBox(
                name: hotel.hotelName,
                address: hotel.hotelAddress,
                price: hotel.hotelPrice,
                rating: hotel.hotelRate,
                coverImage: AppApis.getImageUrl(
                  hotel.hotelImages[Random().nextInt(hotel.hotelImages.length)]
                      .image,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
