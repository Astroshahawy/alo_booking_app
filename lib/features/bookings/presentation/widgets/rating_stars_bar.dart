import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:alo_booking_app/core/constants/constants.dart';

class RatingStarsWidget extends StatelessWidget {
  final String hotelRating;
  const RatingStarsWidget({
    Key? key,
    required this.hotelRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: double.parse(hotelRating) / 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      glow: false,
      ignoreGestures: true,
      itemCount: 5,
      itemSize: 18,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.defaultColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
