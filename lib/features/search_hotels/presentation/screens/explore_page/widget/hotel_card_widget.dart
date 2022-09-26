
import 'package:alo_booking_app/features/search_hotels/domain/entities/hotels_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../cubit/search_hotels_cubit.dart';
import '../../../cubit/search_hotels_state.dart';

class HotelCardWidget extends StatefulWidget {
  HotelCardWidget({Key? key, required this.searchHotels}) : super(key: key);
  HotelsData searchHotels;
  @override
  State<HotelCardWidget> createState() => _HotelCardWidgetState();
}

class _HotelCardWidgetState extends State<HotelCardWidget> {
  @override
  Widget build(BuildContext context) {
    final hotelsList = widget.searchHotels.data;
    return  BlocConsumer<SearchHotelsBloc, SearchHotelsState>(
        listener: (context, state) {
          if (state is SearchHotelsErrorState) {
            debugPrint(state.exception.message.toString());
            debugPrint(state.exception.error.toString());
            debugPrint(state.exception.code.toString());
          }
        },
        builder: (context, state) {
          return ListView.separated(itemBuilder: (context, index) {
            final hotel = hotelsList[index];
          return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  child: CircleAvatar(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.defaultColor,
                      size: 25,
                    ),
                    backgroundColor: AppColors.baseColor,
                    radius: 20,
                  ),
                  alignment: Alignment.topRight,
                ),
              ),
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
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${hotel.name}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('\$${hotel.price}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Wembley, London',
                                style: TextStyle(
                                    color: AppColors.borderSideColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)),
                            Icon(
                              Icons.location_on,
                              color: AppColors.defaultColor,
                              size: 20,
                            ),
                            Text('2.0km to city',
                                style: TextStyle(
                                    color: AppColors.borderSideColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                      Text(
                        '/per night',
                        style: TextStyle(
                            color: AppColors.borderSideColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          if (index == 4) {
                            return Icon(
                              Icons.star_half, color: AppColors.defaultColor,
                              size: 17,);
                          }
                          return Icon(Icons.star, color: AppColors.defaultColor,
                            size: 18,);
                        }),
                      ),
                      Text('80 Reviews', style: TextStyle(
                          color: AppColors.borderSideColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),),
                    ],
                  )
                ],
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
        separatorBuilder: (context, index) => const SizedBox(height: 5,),
        itemCount: hotelsList.length
          );
  });
  }
}
