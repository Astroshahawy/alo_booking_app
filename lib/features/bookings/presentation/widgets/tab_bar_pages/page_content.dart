import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/no_booking_text.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotel.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final List<Hotel> hotelsList;
  final String noBookingText;
  const PageContent({
    Key? key,
    required this.hotelsList,
    required this.noBookingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hotelsList.isEmpty
        ? NoBookingText(text: noBookingText)
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 35),
            itemCount: hotelsList.length,
            itemBuilder: (context, index) {
              return Container();
            },
          );
  }
}
