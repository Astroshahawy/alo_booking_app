import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:flutter/material.dart';

class SliverToBoxAdaptorWidget extends StatelessWidget {
  final Hotels hotel;

  const SliverToBoxAdaptorWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      hotel.hotelName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: hotel.hotelAddress,
                            style: const TextStyle(
                                color: AppColors.borderSideColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                        const WidgetSpan(
                          child: Icon(
                            Icons.location_on,
                            color: AppColors.defaultColor,
                            size: 20,
                          ),
                        ),
                      ], style: const TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text('\$' + hotel.hotelPrice,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const Text(
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
          const Divider(
            color: AppColors.borderSideColor,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Summary',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,


            text: TextSpan(children: [
              TextSpan(
                text: hotel.hotelDescription,
                style: const TextStyle(
                    color: AppColors.borderSideColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 0),
              ),
              WidgetSpan(
                child:  Container(
                  padding: const EdgeInsets.only(bottom: 1, left: 6, right: 6),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child:  const Text(
                    "Read more",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ], style: const TextStyle(color: Colors.black)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      hotel.hotelRate,
                      style: const TextStyle(
                          color: AppColors.defaultColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
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
                            color: AppColors.borderSideColor, fontSize: 16),
                      ),
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
                      const Text('Services',
                          style: TextStyle(
                              color: AppColors.borderSideColor, fontSize: 16)),
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
                              color: AppColors.borderSideColor, fontSize: 16)),
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
                      const Text('Prcie',
                          style: TextStyle(
                              color: AppColors.borderSideColor, fontSize: 16)),
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
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (conetxt, index) {
                return  ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(
                       AppApis.getImageUrl(hotel.hotelImages[index].image) ),
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: hotel.hotelImages.length,
              separatorBuilder: (conetxt, index) {
                return const SizedBox(
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
                 ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child:
                     Image.asset(
                        'assets/images/person.png',
                    width: 70,
                    fit: BoxFit.fill,)

                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                  height: 0)),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Reply',
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
          const Divider(
            color: Colors.white24,
          ),
          const SizedBox(
            height: 15,
          ),
          BouncingButton(
              child: const Text(
                'Book Now',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPress: () {})
        ],
      ),
    );
  }
}
