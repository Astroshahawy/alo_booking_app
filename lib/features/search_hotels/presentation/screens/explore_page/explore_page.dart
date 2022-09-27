import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/profile/presentation/widgets/divider_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/hotel_card_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/sliver_appbar_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/hotels_on_google_map.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.baseColor,
        title: Text('Explore',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 22,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HotelsOnGoogleMap()));
              },
              icon: Icon(
                Icons.location_history,
                size: 22,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 22,
              )),
        ],
      ),
      body: SliverAppBarWidget(),
    );
  }
}
