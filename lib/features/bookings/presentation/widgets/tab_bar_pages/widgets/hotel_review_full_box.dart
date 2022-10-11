import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/rating_stars_bar.dart';

class HotelReviewFullBox extends StatefulWidget {
  final String coverImage;
  final String name;
  final String price;
  final String address;
  final String rating;
  const HotelReviewFullBox({
    Key? key,
    required this.coverImage,
    required this.name,
    required this.price,
    required this.address,
    required this.rating,
  }) : super(key: key);

  @override
  State<HotelReviewFullBox> createState() => _HotelReviewFullBoxState();
}

class _HotelReviewFullBoxState extends State<HotelReviewFullBox>
    with AutomaticKeepAliveClientMixin<HotelReviewFullBox> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AppThemeBloc, AppThemeState>(
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.coverImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                wordSpacing: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              widget.address,
                              style: const TextStyle(
                                color: AppLightColors.accentColor1,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            RatingStarsWidget(hotelRating: widget.rating),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
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
