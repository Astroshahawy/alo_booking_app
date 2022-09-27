import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/ratingbar_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PreDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  floating: true,
                  collapsedHeight: MediaQuery.of(context).size.height,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/background.png',
                              ),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white54,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.baseColor,
                                  ),
                                ),
                                Spacer(),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: AppColors.defaultColor,
                                    size: 25,
                                  ),
                                  backgroundColor: AppColors.baseColor,
                                  radius: 25,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.transparent.withOpacity(0.4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hotel NAME',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              'Hotel location',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color: AppColors.defaultColor,
                                              size: 20,
                                            ),
                                            Text(
                                              '2.0 km to the city',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const RatingBarWidget(),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '80 Reviews ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                Text('\$' + '100',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20)),
                                                const Text(
                                                  '/per night',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .borderSideColor,
                                                      fontSize: 16),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        BouncingButton(
                                            child: const Text('Book Now'),
                                            onPress: () {})
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: BouncingButton(
                                height: 35,
                                width: 120,
                                color: Colors.transparent.withOpacity(0.4),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'More Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_downward_rounded,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                onPress: () {}),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ))
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hotel NAME',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Hotel location',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.location_on,
                              color: AppColors.defaultColor,
                              size: 20,
                            ),
                            Text(
                              '2.0 km to the city',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children:const [
                        Text('\$' + '100',
                            style:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                         Text(
                          '/per night',
                          style: TextStyle(
                              color: AppColors.borderSideColor, fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: AppColors.borderSideColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Summary',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'featuring a fitness center, (Name of the Hotel) is Located  in (hotel location)..',
                          style: TextStyle(
                              color: AppColors.borderSideColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 0)),
                      // WidgetSpan(
                      //   child:TextButton(child: Text('read more'),onPressed: (){},),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const[
                          Text(
                            '8.8',
                            style: TextStyle(
                                color: AppColors.defaultColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                           SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Overall rating',
                            style: TextStyle(
                                color: AppColors.borderSideColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                           const Text(
                              'Room',
                              style: TextStyle(
                                  color: AppColors.borderSideColor,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    thumbColor: Colors.transparent,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 0.0)),
                                child: Slider(
                                    thumbColor: Colors.transparent,
                                    inactiveColor: Colors.transparent,
                                    activeColor: AppColors.defaultColor,
                                    min: 0,
                                    max: 100,
                                    value: 100,
                                    onChanged: (value) {}),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            const Text('Services',
                                style: TextStyle(
                                    color: AppColors.borderSideColor,
                                    fontSize: 16)),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    thumbColor: Colors.transparent,
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 0.0)),
                                child: Slider(
                                    thumbColor: Colors.transparent,
                                    inactiveColor: Colors.transparent,
                                    activeColor: AppColors.defaultColor,
                                    min: 0,
                                    max: 100,
                                    value: 100,
                                    onChanged: (value) {}),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            const Text('Location',
                                style: TextStyle(
                                    color: AppColors.borderSideColor,
                                    fontSize: 16)),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    thumbColor: Colors.transparent,
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 0.0)),
                                child: Slider(
                                    thumbColor: Colors.transparent,
                                    inactiveColor: Colors.transparent,
                                    activeColor: AppColors.defaultColor,
                                    min: 0,
                                    max: 100,
                                    value: 80,
                                    onChanged: (value) {}),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Text('Prcie',
                                style: const TextStyle(
                                    color: AppColors.borderSideColor,
                                    fontSize: 16)),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    thumbColor: Colors.transparent,
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 0.0)),
                                child: Slider(
                                    thumbColor: Colors.transparent,
                                    inactiveColor: Colors.transparent,
                                    activeColor: AppColors.defaultColor,
                                    min: 0,
                                    max: 100,
                                    value: 100,
                                    onChanged: (value) {}),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Photo',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'View all',
                      style: TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.defaultColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Colors.transparent,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (conetxt, index) {
                      return const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          image: NetworkImage(
                              'http://api.mahmoudtaha.com/images/35321662903840.jpg'),
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: 10,
                    separatorBuilder: (conetxt, index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Reviews',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'View all',
                      style: TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.defaultColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  child: Row(
                    children: [
                     const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          image: NetworkImage(
                              'http://api.mahmoudtaha.com/images/35321662903840.jpg'),
                          width: 70,
                          fit: BoxFit.fill,
                        ),
                      ),
                     const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [
                             Text('Alexa jan',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text('last update21 May,2019',
                                  style: TextStyle(
                                      color: AppColors.borderSideColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 0)),
                              Text('(8.0)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    'This is located in a great spot close to shops and bars , very quite location',
                    style: TextStyle(
                        color: AppColors.borderSideColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 0))
              ],
            ),
          )),
    );
  }
}
