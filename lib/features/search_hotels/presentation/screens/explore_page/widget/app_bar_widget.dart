
import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../filtter_page/filter_page.dart';
import '../../hotels_on_google_map/hotels_on_google_map_page.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key, this.searchController}) : super(key: key);
  TextEditingController? searchController;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.baseColor,
      title: Text('Explore',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 22,
          )),
      actions: [
        IconButton(
            onPressed: () {
              //SearchHotelsBloc.get(context).changeSearchMap();
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    HotelsOnMapPage(hotelsMap:
                    // widget.searchController!.text.isEmpty?
                    SearchHotelsBloc.searchHotelsList
                    == null ?
                    SearchHotelsBloc.hotels!.data :
                    // SearchHotelsBloc.searchHotelsList
                        // != null ?
                    SearchHotelsBloc.searchHotelsList!.data!.data
                        // : hotels.data,
                    )));
            },
            icon: Icon(
              Icons.map,
              size: 22,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 22,
            )),
      ],
    );
  }
}
