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
            imageUrl: AppApis.getImageUrl(hotel.hotelImages[1].image),
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
            duration: Duration(milliseconds: 0),
            opacity: (1 - (offset / (MediaQuery.of(context).size.height - 200)))
                .clamp(0, 1),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel.hotelName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: hotel.hotelAddress,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                              const WidgetSpan(
                                child: Icon(
                                  Icons.location_on,
                                  color: AppColors.defaultColor,
                                  size: 20,
                                ),
                              ),
                            ], style: const TextStyle(color: Colors.black)),
                          ),
                          Row(
                            children: [
                              const RatingBarWidget(),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '80 Reviews ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text('\$${hotel.hotelPrice}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  const Text(
                                    '/per night',
                                    style: TextStyle(
                                        color: AppColors.borderSideColor,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          BouncingButton(
                            child: const Text(
                              'Book Now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPress: () {},
                          // onPress: () => BookingsBloc.get(context).createBooking(hotelId: hotel.hotelId),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BouncingButton(
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
