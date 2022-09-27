import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/no_booking_text.dart';
import 'package:flutter/material.dart';

class CanceledBookingsPage extends StatelessWidget {
  const CanceledBookingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoBookingText(text: 'No canceled bookings yet..');

    // return BlocBuilder<TasksBloc, TasksState>(
    //   builder: (context, state) {
    //     return PageContent(
    //       tasksList: TasksBloc.get(context).favoriteTasks,
    //       noTasksText: 'No favored tasks yet..',
    //     );
    //   },
    // );
  }
}
