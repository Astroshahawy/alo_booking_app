import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/no_booking_text.dart';
import 'package:flutter/material.dart';

class CanceledBookingsPage extends StatefulWidget {
  const CanceledBookingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CanceledBookingsPage> createState() => _CanceledBookingsPageState();
}

class _CanceledBookingsPageState extends State<CanceledBookingsPage>
    with AutomaticKeepAliveClientMixin<CanceledBookingsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const NoBookingText(text: 'No canceled bookings yet..');
  }

  @override
  bool get wantKeepAlive => true;
}
