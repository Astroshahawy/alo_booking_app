import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/app_bar_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_page/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../profile/presentation/widgets/divider_widget.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../../cubit/search_hotels_state.dart';
import 'hotel_card_widget.dart';

class SliverAppBarWidget extends StatefulWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  final searchController = TextEditingController();
  String hotelsNumb = '7';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SearchHotelsBloc.get(context).searchHotels(hotelName: '');
    // hotels = SearchHotelsBloc.searchHotelsList!.data!;
    // print(hotels.toString());
    //hotels!.data[0];
    // debugPrint(SearchHotelsBloc.hotels!.data[0].toString());
    searchController.text.isNotEmpty
        ? SearchHotelsBloc.get(context)
            .searchHotels(hotelName: searchController.text)
        : null;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBarWidget(searchController: searchController),
      ),
      body: BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
          builder: (context, state) {
        // print(SearchHotelsBloc.hotels!);
        if (SearchHotelsBloc.hotels != null) {
          hotelsNumb = SearchHotelsBloc.hotels!.data.length.toString();
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColors.baseColor,
                  expandedHeight: 170,
                  collapsedHeight: 60,
                  titleSpacing: 10,
                  flexibleSpace: bookingDetails(),
                  pinned: true,
                  floating: true,
                  leading: const SizedBox(),
                  forceElevated: innerBoxIsScrolled,
                  bottom: resultFiltter(),
                ),
              ];
            },
            body: //Container(),
                SearchHotelsBloc.hotels != null
                    ?
                    // SearchHotelsBloc.searchMap ? HotelsOnMapPage(hotelsMap: searchController.text.isEmpty?
                    // SearchHotelsBloc.hotels!.data :
                    // // SearchHotelsBloc.searchHotelsList
                    // // != null ?
                    // SearchHotelsBloc.searchHotelsList!.data!.data
                    //   // : hotels.data,
                    // ):
                    HotelCardWidget(
                        searchHotels: SearchHotelsBloc.searchHotelsList != null
                            ? SearchHotelsBloc.searchHotelsList!.data!.data
                            : SearchHotelsBloc.hotels!.data,
                        // searchController.text.isEmpty ?
                        // SearchHotelsBloc.hotels!.data
                        //     : SearchHotelsBloc.searchHotelsList != null
                        //     ? SearchHotelsBloc.searchHotelsList!.data!.data
                        //     : SearchHotelsBloc.hotels!.data,
                      )
                    : Center(child: Lottie.asset("assets/config/spinner.json")),
          );
        } else {
          return Center(
              child: Lottie.asset(
            "assets/config/spinner.json",
          ));
        }
      }),
    );
  }

  PreferredSize resultFiltter() {
    return PreferredSize(
      preferredSize: Size.zero,
      child: Column(
        children: [
          dividerWidget(0, 0, 0),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //SearchHotelsBloc.hotels != null? '10 Hotel Found' :
                  SearchHotelsBloc.hotelsNumber != null
                      ? '${SearchHotelsBloc.hotelsNumber} Hotel Found'
                      : '${SearchHotelsBloc.hotels!.data.length} Hotel Found',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Text(
                      'Filtter',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FilterPage(
                                    searchText: searchController.text),
                              ));
                        },
                        icon: const Icon(Icons.ac_unit)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bookingDetails() {
    return FlexibleSpaceBar(
      background: Container(
        padding: const EdgeInsets.only(
          left: 25,
          right: 10,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (searchedCharacter) {
                        if(searchController.text.isEmpty) {
                          searchAboutHotel(searchedCharacter);
                        }
                      },
                      controller: searchController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 1.5, color: Colors.transparent),
                        ),
                        contentPadding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15),
                        filled: true,
                        fillColor: AppColors.cardColor,
                        focusColor: AppColors.defaultColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 1.5, color: Colors.transparent),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 1.5, color: Colors.transparent),
                        ),
                        hintText: "London...",
                        hintStyle: const TextStyle(
                          color: AppColors.borderSideColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),

                  RawMaterialButton(
                    onPressed: () {
                      // if (searchController.text.isEmpty) {
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(const SnackBar(
                      //           backgroundColor: AppColors.baseColor,
                      //           content: Text(
                      //             'Enter Hotel Name',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 18,
                      //                 color: Colors.white),
                      //           )));
                      // } else {
                      SearchHotelsBloc.get(context)
                          .searchHotels(hotelName: searchController.text
                              // searchOptionsModel: const SearchOptionsModel(
                              //     '', '', '', '', '', '', '', '', '', []
                              // ),
                              );
                      FocusScope.of(context).unfocus();
                      // }
                    },
                    elevation: 2.0,
                    fillColor: AppColors.defaultColor,
                    padding: const EdgeInsets.all(8.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.search_outlined,
                      color: AppColors.cardColor,
                      size: 32,
                    ),
                  ),
                  //SizedBox(width: 5),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Choose Date',
                          style: TextStyle(
                              color: AppColors.borderSideColor, fontSize: 15)),
                      Text('20 Sep - 25 Sep', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 35,
                      color: AppColors.borderSideColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Nunber of Room',
                              style: TextStyle(
                                  color: AppColors.borderSideColor,
                                  fontSize: 15)),
                          Text('1 Room  2 People',
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void searchAboutHotel(String searchedCharacter) {
    SearchHotelsBloc.get(context).searchHotels(hotelName: searchedCharacter);
    setState(() {});
  }
}
