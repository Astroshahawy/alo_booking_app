import 'package:flutter/material.dart';

import '../../../cubit/search_hotels_cubit.dart';
import '../../hotels_on_google_map/hotels_on_google_map_page.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key, this.searchController}) : super(key: key);
  final TextEditingController? searchController;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Explore',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_outlined,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {
            //SearchHotelsBloc.get(context).changeSearchMap();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelsOnMapPage(
                    hotelsMap:
                        // widget.searchController!.text.isEmpty?
                        SearchHotelsBloc.searchHotelsList == null
                            ? SearchHotelsBloc.hotels!.data
                            :
                            // SearchHotelsBloc.searchHotelsList
                            // != null ?
                            SearchHotelsBloc.searchHotelsList!.data!.data
                    // : hotels.data,
                    ),
              ),
            );
          },
          icon: const Icon(
            Icons.map,
            size: 24,
          ),
        ),
      ],
    );
  }
}
