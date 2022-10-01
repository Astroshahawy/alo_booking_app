import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/explore_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlexibleSpaceWidget extends StatelessWidget {
  final List<String> images;

  const FlexibleSpaceWidget(this.images, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
        return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: SafeArea(
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        height: 400,
                        aspectRatio: 1),
                    items: cubit.hotels.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child:
                            Stack(
                              children: [
                                Container(height: 400,
                                  child: CachedNetworkImage(
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                    imageUrl: AppApis.getImageUrl(i.hotelImages[0].image),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) => Center(
                                      child: CircularProgressIndicator(color: AppColors.defaultColor,
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 30,left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Text(
                                            i.hotelName,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          const Text(
                                            'Extraordinary five-star \n outdoor activities',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          BouncingButton(
                                              width: 120,
                                              child: const Text(
                                                'View Hotel',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              onPress: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ExplorePage(),));
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BouncingButton(
                          color: Colors.black87,
                          height: 55,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: AppColors.defaultColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Where are you going?',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white24),
                                )
                              ],
                            ),
                          ),
                          onPress: () {

                          },
                        ),
                        const Spacer(),

                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
