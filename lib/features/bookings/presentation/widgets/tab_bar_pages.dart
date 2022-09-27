import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/canceled_page.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/completed_page.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/upcoming_page.dart';
import 'package:flutter/material.dart';

class TabBarPages extends StatelessWidget {
  const TabBarPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          UpcomingBookingsPage(
            key: PageStorageKey('UpcomingBookingsPage'),
          ),
          CompletedBookingsPage(
            key: PageStorageKey('CompletedBookingsPage'),
          ),
          CanceledBookingsPage(
            key: PageStorageKey('CanceledBookingsPage'),
          ),
        ],
      ),
    );
  }
}
