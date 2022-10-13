import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/rating_stars_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelReviewMiniBox extends StatefulWidget {
  final String coverImage;
  final String name;
  final String price;
  final String address;
  final String rating;
  const HotelReviewMiniBox({
    Key? key,
    required this.coverImage,
    required this.name,
    required this.price,
    required this.address,
    required this.rating,
  }) : super(key: key);

  @override
  State<HotelReviewMiniBox> createState() => _HotelReviewMiniBoxState();
}

class _HotelReviewMiniBoxState extends State<HotelReviewMiniBox>
    with AutomaticKeepAliveClientMixin<HotelReviewMiniBox> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.165,
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.coverImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
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
                      Text(
                        widget.name,overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          wordSpacing: 1,
                        ),
                      ),
                      Text(
                        widget.address,
                        style: const TextStyle(
                          color: AppLightColors.accentColor1,
                          fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis,
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
                              // Row(
                              //   children: const [
                              //     Icon(
                              //       Icons.location_on,
                              //       color: AppColors.defaultColor,
                              //       size: 15,
                              //     ),
                              //     SizedBox(width: 2),
                              //     Text(
                              //       '2.0 km to city',
                              //       style: TextStyle(
                              //         color: AppLightColors.accentColor1,
                              //         fontWeight: FontWeight.w400,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              RatingStarsWidget(hotelRating: widget.rating),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '\$${widget.price}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const Text(
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
