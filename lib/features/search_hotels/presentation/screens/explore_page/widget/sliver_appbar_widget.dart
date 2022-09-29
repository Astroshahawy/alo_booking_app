import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/hotel_model.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/hotels_data_model.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/app_bar_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_page/filter_page.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/hotels_on_google_map/hotels_on_google_map_page.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/hotels_on_google_map/widget/hotels_on_google_map_widget.dart';
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
  Widget build(BuildContext context) {

    // SearchHotelsBloc.get(context).searchHotels(hotelName: '');
    // hotels = SearchHotelsBloc.searchHotelsList!.data!;
    // print(hotels.toString());
    //hotels!.data[0];
    // debugPrint(SearchHotelsBloc.hotels!.data[0].toString());
    searchController.text.isNotEmpty ? SearchHotelsBloc.get(context).searchHotels(hotelName:searchController.text) : null;
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBarWidget(searchController: searchController),
      ),
      body: BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
          builder: (context, state)
          {
            // print(SearchHotelsBloc.hotels!);
            if(SearchHotelsBloc.hotels!= null) {
              hotelsNumb = SearchHotelsBloc.hotels!.data.length.toString();
              return NestedScrollView(
                headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: AppColors.baseColor,
                      expandedHeight: 170,
                      collapsedHeight: 60,
                      titleSpacing: 10,
                      flexibleSpace: bookingDetails(),
                      pinned: true,
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: resultFiltter(),
                    ),
                  ];
                },
                body: //Container(),
                SearchHotelsBloc.hotels != null ?
                // SearchHotelsBloc.searchMap ? HotelsOnMapPage(hotelsMap: searchController.text.isEmpty?
                // SearchHotelsBloc.hotels!.data :
                // // SearchHotelsBloc.searchHotelsList
                // // != null ?
                // SearchHotelsBloc.searchHotelsList!.data!.data
                //   // : hotels.data,
                // ):
                HotelCardWidget(
                  searchHotels:
                  SearchHotelsBloc.searchHotelsList != null?
                  SearchHotelsBloc.searchHotelsList!.data!.data
                      : SearchHotelsBloc.hotels!.data,
                  // searchController.text.isEmpty ?
                  // SearchHotelsBloc.hotels!.data
                  //     : SearchHotelsBloc.searchHotelsList != null
                  //     ? SearchHotelsBloc.searchHotelsList!.data!.data
                  //     : SearchHotelsBloc.hotels!.data,

                ) : Center(child: Lottie.asset("assets/config/spinner.json")),

              );
            }else{
              return  Center(child: Lottie.asset("assets/config/spinner.json",));
            }
          }),
    );
  }

  PreferredSize resultFiltter(){
    return PreferredSize(
      preferredSize: Size.zero,
      child: Column(
        children: [
          dividerWidget(0, 0,0),
          Container(
            padding: EdgeInsets.only(left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //SearchHotelsBloc.hotels != null? '10 Hotel Found' :
                  SearchHotelsBloc.hotelsNumber != null ?
                  '${SearchHotelsBloc.hotelsNumber} Hotel Found' :
                  '${SearchHotelsBloc.hotels!.data.length} Hotel Found',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      'Filtter',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(searchText: searchController.text),));
                        }, icon: Icon(Icons.ac_unit)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget bookingDetails(){
    return FlexibleSpaceBar(
      background: Container(
        padding: EdgeInsets.only(left: 25, right: 10,),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      if(searchController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(backgroundColor: AppColors.baseColor,
                                content: Text('Enter Hotel Name', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),)));
                      }
                      else{
                        SearchHotelsBloc.get(context).searchHotels(hotelName: searchController.text
                          // searchOptionsModel: const SearchOptionsModel(
                          //     '', '', '', '', '', '', '', '', '', []
                          // ),
                        );
                      }
                    },
                    elevation: 2.0,
                    fillColor: AppColors.defaultColor,
                    child: Icon(
                      Icons.search_outlined,
                      color: AppColors.cardColor,
                      size: 32,
                    ),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  ),
                  //SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      onChanged: (searchedCharacter){
                        searchAboutHotel(searchedCharacter);
                      },
                      textDirection: TextDirection.rtl,
                      controller: searchController,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 15),
                          filled: true,
                          fillColor: AppColors.cardColor,
                          focusColor: AppColors.defaultColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Colors.transparent),
                          ),
                          hintText: "London...",
                          hintStyle: TextStyle(
                            color: AppColors.borderSideColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                          hintTextDirection: TextDirection.rtl),
                    ),
                  ),
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
                    children: [
                      Text('Choose Date',
                          style: TextStyle(
                              color: AppColors.borderSideColor,
                              fontSize: 15)),
                      Text('20 Sep - 25 Sep',
                          style: TextStyle(fontSize: 15)),
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
                        children: [
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
