import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
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
  final double offset;

  const FlexibleSpaceWidget(this.images, this.offset, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HotelsCubit>(context);
        return Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: cubit.hotels.map((i) {
                return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: AppApis.getImageUrl(i.hotelImages[0].image),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              color: AppColors.defaultColor,
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 0),
                          opacity: (1 -
                                  (offset /
                                      ((MediaQuery.of(context).size.height *
                                              0.65) -
                                          200)))
                              .clamp(0, 1),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30, left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  i.hotelName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                const Text(
                                  'Extraordinary five-star\noutdoor activities',
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
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.exploreScreen,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  BouncingButton(
                    color: AppThemeBloc.get(context).isDarkMode
                        ? AppDarkColors.primaryColor
                        : AppLightColors.primaryColor,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColors.defaultColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Where are you going?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppThemeBloc.get(context).isDarkMode
                                  ? AppDarkColors.accentColor1
                                  : AppLightColors.accentColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPress: () {},
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
