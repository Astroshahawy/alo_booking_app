import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/rating_stars_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedBookingsPage extends StatelessWidget {
  const CompletedBookingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 7,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      itemBuilder: (context, index) => BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.16,
            margin: const EdgeInsets.symmetric(vertical: 12.5),
            decoration: BoxDecoration(
              color: AppThemeBloc.get(context).isDarkMode
                  ? AppDarkColors.primaryColor
                  : AppLightColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 7.0,
                  offset: const Offset(0.0, 5.0),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEToqDOfAtJqlcLhymiSOe6TQjz7wQLWHNq3gUcP79eg&s'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hotel name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 1,
                          ),
                        ),
                        const Text(
                          'Wembley, London',
                          style: TextStyle(
                            color: AppLightColors.accentColor1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.defaultColor,
                                      size: 15,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      '2.0 km to city',
                                      style: TextStyle(
                                        color: AppLightColors.accentColor1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const RatingStarsWidget(),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  'E£500',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  '/per night',
                                  style: TextStyle(
                                    color: AppLightColors.accentColor1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    // return const NoBookingText(text: 'No completed bookings yet..');
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
