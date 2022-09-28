import 'package:alo_booking_app/features/search_hotels/presentation/screens/hotels_on_google_map/widget/hotels_on_google_map_card_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/hotels_on_google_map/widget/hotels_on_google_map_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/hotel.dart';

class HotelsOnMapPage extends StatefulWidget {
  HotelsOnMapPage({Key? key, required this.hotelsMap}) : super(key: key);
  List<Hotel> hotelsMap;
  @override
  State<HotelsOnMapPage> createState() => _HotelsOnMapPageState();
}

class _HotelsOnMapPageState extends State<HotelsOnMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            HotelsOnGoogleMapWidget(hotels: widget.hotelsMap),
            Positioned(
              left: 10, right: 10,
              bottom: 10,
              child: Container(height:145,width: MediaQuery.of(context).size.width*0.9,
                  child: HotelsOnGoogleMapCardWidget(searchHotels: widget.hotelsMap)),
            ),
          ],
        ),
      ),
    );
  }
}
