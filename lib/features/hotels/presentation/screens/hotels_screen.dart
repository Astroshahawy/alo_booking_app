import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/slide_fade_animation.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/hotel_review_mini_box.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/hotels/presentation/screens/details_screen.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/flexiblespace_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/ratingbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          return Scaffold(
            body: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    elevation: 0.0,
                    pinned: true,
                    collapsedHeight: 200,
                    expandedHeight: 380,
                    flexibleSpace: StatefulBuilder(
                      builder: (context, setState) {
                        scrollController.addListener(() {
                          setState
                              .call((() => offset = scrollController.offset));
                        });
                        return FlexibleSpaceWidget(cubit.images, offset);
                      },
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.detailsScreen,
                              arguments: cubit.hotels[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: HotelReviewMiniBox(
                            coverImage: AppApis.getImageUrl(
                                cubit.hotels[index].hotelImages[0].image),
                            name: cubit.hotels[index].hotelName,
                            price: cubit.hotels[index].hotelPrice,
                            address: cubit.hotels[index].hotelAddress,
                            rating: cubit.hotels[index].hotelRate,
                          ),
                        ));
                  }, childCount: cubit.hotels.length))
                ]),
          );
        },
      ),
    );
  }
}
