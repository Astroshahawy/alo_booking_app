import 'dart:math';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/hotel_review_mini_box.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/loading_indicator.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/flexiblespace_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  ScrollController scrollController = ScrollController();
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HotelsCubit>()..getHotels(),
      child: BlocBuilder<HotelsCubit, HotelsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HotelsCubit>(context);
          if (state is GetHotelsLoadingState) {
            return const LoadingIndicator();
          }
          return Scaffold(
            body: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  elevation: 0.0,
                  pinned: true,
                  collapsedHeight: 200,
                  expandedHeight: MediaQuery.of(context).size.height * 0.65,
                  flexibleSpace: StatefulBuilder(
                    builder: (context, setState) {
                      scrollController.addListener(() {
                        setState.call((() => offset = scrollController.offset));
                      });
                      return FlexibleSpaceWidget(cubit.images, offset);
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 25,
                      right: 25,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Best Deals',
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: AppColors.defaultColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors.defaultColor,
                              size: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final hotel = cubit.hotels[index];
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.detailsScreen,
                                arguments: hotel);
                          },
                          child: HotelReviewMiniBox(
                            coverImage: AppApis.getImageUrl(
                                hotel.hotelImages[Random().nextInt(hotel.hotelImages.length)].image),
                            name: hotel.hotelName,
                            price: hotel.hotelPrice,
                            address: hotel.hotelAddress,
                            rating: hotel.hotelRate,
                          ));
                    },
                    itemCount: cubit.hotels.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
