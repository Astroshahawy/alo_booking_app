import 'dart:ui';

import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/ratingbar_widget.dart';

class SliverAppbarBackgroundWidget extends StatelessWidget {
  final Hotels hotel;
  final double offset;

  const SliverAppbarBackgroundWidget({
    Key? key,
    required this.hotel,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: double.infinity,
          child: CachedNetworkImage(
            imageUrl: AppApis.getImageUrl(hotel.hotelImages[2].image),
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.defaultColor,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 0),
            opacity: (1 - (offset / (MediaQuery.of(context).size.height - 200)))
                .clamp(0, 1),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 25, right: 25),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          hotel.hotelName,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                          maxLines: 1,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: hotel.hotelAddress,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14)),
                                                const WidgetSpan(
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color:
                                                        AppColors.defaultColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                              style: const TextStyle(
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: const [
                                            RatingBarWidget(),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '80 Reviews ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${hotel.hotelPrice}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const Text(
                                        '/per night',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              BouncingButton(
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPress: () {
                                  BookingsBloc.get(context).createBooking(
                                      hotelId: hotel.hotelId, context: context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                BouncingButton(
                    height: 35,
                    width: 120,
                    color: Colors.transparent.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: const [
                          Text(
                            '  More Details',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward_rounded,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    onPress: () {}),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 35,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: AppThemeBloc.get(context).isDarkMode
                  ? AppLightColors.primaryColor.withOpacity(0.5)
                  : AppDarkColors.primaryColor.withOpacity(0.5),
              child: Icon(
                Icons.arrow_back,
                color: AppThemeBloc.get(context).isDarkMode
                    ? AppDarkColors.primaryColor
                    : AppLightColors.primaryColor,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 35,
          child: CircleAvatar(
            backgroundColor: AppThemeBloc.get(context).isDarkMode
                ? AppDarkColors.primaryColor
                : AppLightColors.primaryColor,
            radius: 22,
            child: const Icon(
              Icons.favorite_border_outlined,
              color: AppColors.defaultColor,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
