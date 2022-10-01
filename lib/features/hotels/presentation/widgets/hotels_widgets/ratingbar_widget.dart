
import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 4.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemPadding: EdgeInsets.symmetric(
          horizontal: 0.0),
      itemBuilder: (context, _) =>
      const Icon(
        Icons.star,
        color: AppColors.defaultColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
