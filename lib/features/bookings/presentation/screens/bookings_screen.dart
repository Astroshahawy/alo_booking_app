import 'package:alo_booking_app/features/bookings/presentation/widgets/booking_widget.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookingsWidget()),
    );
  }
}
