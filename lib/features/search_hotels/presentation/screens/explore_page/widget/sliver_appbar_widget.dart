import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/features/bookings/presentation/widgets/tab_bar_pages/widgets/loading_indicator.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/app_bar_widget.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/filter_page/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../profile/presentation/widgets/divider_widget.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../../cubit/search_hotels_state.dart';
import 'hotel_card_widget.dart';
import 'dart:math' as math;

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
    if (searchController.text.isNotEmpty) {
      SearchHotelsBloc.get(context)
          .searchHotels(hotelName: searchController.text);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBarWidget(searchController: searchController),
      ),
      body: BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
        builder: (context, state) {
          if (SearchHotelsBloc.hotels != null) {
            hotelsNumb = SearchHotelsBloc.hotels!.data.length.toString();
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: false,
                  delegate: SliverAppBarDelegate(
                    minHeight: 75,
                    maxHeight: 75,
                    child: Center(
                      child: bookingDetails(),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 55,
                    maxHeight: 55,
                    child: resultFilter(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SearchHotelsBloc.hotels != null
                          ? HotelCardWidget(
                              searchHotels:
                                  SearchHotelsBloc.searchHotelsList != null
                                      ? SearchHotelsBloc
                                          .searchHotelsList!.data!.data
                                      : SearchHotelsBloc.hotels!.data,
                            )
                          : const LoadingIndicator(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }

  Widget resultFilter() {
    return Column(
      children: [
        const DividerWidget(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          color: AppThemeBloc.get(context).isDarkMode
              ? AppDarkColors.backgroundColor
              : AppLightColors.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<SearchHotelsBloc, SearchHotelsState>(
                builder: (context, state) {
                  return Text(
                    SearchHotelsBloc.hotelsNumber != null
                        ? '${SearchHotelsBloc.hotelsNumber} Hotel Found'
                        : '${SearchHotelsBloc.hotels!.data.length} Hotel Found',
                    style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: 0.5,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FilterPage(searchText: searchController.text),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 0.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FilterPage(searchText: searchController.text),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.filter_alt_rounded,
                            color: AppColors.defaultColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bookingDetails() {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: TextField(
                    onChanged: (searchedCharacter) {
                      if (searchController.text.isEmpty) {
                        searchAboutHotel(searchedCharacter);
                      }
                    },
                    controller: searchController,
                    style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: AppColors.defaultColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1.5, color: Colors.transparent),
                      ),
                      contentPadding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                      filled: true,
                      fillColor: AppThemeBloc.get(context).isDarkMode
                          ? AppDarkColors.primaryColor
                          : AppLightColors.primaryColor,
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
                      hintText: 'Type a hotel name..',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: AppThemeBloc.get(context).isDarkMode
                            ? AppDarkColors.accentColor2
                            : AppLightColors.accentColor2,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  SearchHotelsBloc.get(context)
                      .searchHotels(hotelName: searchController.text);
                  FocusScope.of(context).unfocus();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8.0),
                  elevation: 2.0,
                  primary: AppColors.defaultColor,
                ),
                child: Icon(
                  Icons.search_outlined,
                  color: AppThemeBloc.get(context).isDarkMode
                      ? AppDarkColors.primaryColor
                      : AppLightColors.primaryColor,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void searchAboutHotel(String searchedCharacter) {
    SearchHotelsBloc.get(context).searchHotels(hotelName: searchedCharacter);
    setState(() {});
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
