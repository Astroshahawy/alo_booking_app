import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/rating_stars_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingBookingsPage extends StatelessWidget {
  const UpcomingBookingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 7,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      itemBuilder: (context, index) => BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
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
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEToqDOfAtJqlcLhymiSOe6TQjz7wQLWHNq3gUcP79eg&s'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: AppThemeBloc.get(context).isDarkMode
                            ? AppDarkColors.primaryColor
                            : AppLightColors.primaryColor,
                        radius: 18,
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: AppColors.defaultColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Hotel name',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            'E£500',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Wembley, London',
                                style: TextStyle(
                                  color: AppLightColors.accentColor1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.location_on,
                                color: AppColors.defaultColor,
                                size: 20,
                              ),
                              Text(
                                '2.0km to city',
                                style: TextStyle(
                                  color: AppLightColors.accentColor1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '/per night',
                            style: TextStyle(
                                color: AppLightColors.accentColor1,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          RatingStarsWidget(),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '80 Reviews',
                            style: TextStyle(
                              color: AppLightColors.accentColor1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    // return const NoBookingText(text: 'No upcoming bookings yet..');
    // return BlocBuilder<BookingBloc, BookingState>(
    //   builder: (context, state) {
    //     return PageContent();
    //   },
    // );
  }
}
