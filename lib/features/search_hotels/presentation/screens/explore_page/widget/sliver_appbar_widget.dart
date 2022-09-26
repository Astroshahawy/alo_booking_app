import 'package:alo_booking_app/features/search_hotels/data/models/hotel_model.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/hotels_data_model.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filtter_page/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    // SearchHotelsBloc.get(context).searchHotels(hotelName: '');
    // hotels = SearchHotelsBloc.searchHotelsList!.data!;
    // print(hotels.toString());
    //hotels!.data[0];
    // debugPrint(SearchHotelsBloc.hotels!.data[0].toString());
    HotelsData  hotels =  HotelsDataModel(data:[HotelModel(),HotelModel(),HotelModel(),HotelModel()]
    );
    return BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
        builder: (context, state)
    {
      // print(SearchHotelsBloc.hotels!);
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
        HotelCardWidget(
            searchHotels:
            //SearchHotelsBloc.searchHotelsList == null
              searchController.text.isEmpty?
            hotels
               :  SearchHotelsBloc.searchHotelsList != null ? SearchHotelsBloc.searchHotelsList!.data!: hotels,
          ),

      );
   });
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
                  '350 Hotel Found',
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(),));
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
