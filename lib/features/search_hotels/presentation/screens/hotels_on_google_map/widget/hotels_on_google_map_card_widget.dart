import 'package:alo_booking_app/features/search_hotels/domain/entities/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../../cubit/search_hotels_state.dart';

class HotelsOnGoogleMapCardWidget extends StatefulWidget {
  HotelsOnGoogleMapCardWidget({Key? key, required this.searchHotels})
      : super(key: key);
  List<Hotel> searchHotels;
  @override
  State<HotelsOnGoogleMapCardWidget> createState() =>
      _HotelsOnGoogleMapCardWidgetState();
}

class _HotelsOnGoogleMapCardWidgetState
    extends State<HotelsOnGoogleMapCardWidget> {
  @override
  Widget build(BuildContext context) {
    final hotelsList = widget.searchHotels;
    return BlocConsumer<SearchHotelsBloc, SearchHotelsState>(
        listener: (context, state) {
      if (state is SearchHotelsErrorState) {
        debugPrint(state.exception.message.toString());
        debugPrint(state.exception.error.toString());
        debugPrint(state.exception.code.toString());
      }
    }, builder: (context, state) {
      return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final hotel = hotelsList[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.85,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    //height: 100,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            // hotel.hotelImages == null ||  hotel.hotelImages == []
                            // ?
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEToqDOfAtJqlcLhymiSOe6TQjz7wQLWHNq3gUcP79eg&s'
                            // :'http://api.mahmoudtaha.com/images/${hotel.hotelImages![0].image.toString()}'

                            ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${'Grand Royal Hotel'}',overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 2,
                              ),
                              Text('Wembley, London',
                                  style: TextStyle(
                                      color: AppColors.borderSideColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //color:Colors.green,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.defaultColor,
                                          size: 20,
                                        ),
                                        Text('2.0km to city',
                                            style: TextStyle(
                                                color:
                                                    AppColors.borderSideColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('\$180',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: List.generate(5, (index) {
                                      if (index == 4) {
                                        return Icon(
                                          Icons.star_half,
                                          color: AppColors.defaultColor,
                                          size: 17,
                                        );
                                      }
                                      return Icon(
                                        Icons.star,
                                        color: AppColors.defaultColor,
                                        size: 18,
                                      );
                                    }),
                                  ),
                                  Text(
                                    '/per night',
                                    style: TextStyle(
                                        color: AppColors.borderSideColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount: hotelsList.length);
    });
  }
}
