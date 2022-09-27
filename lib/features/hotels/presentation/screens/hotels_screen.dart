import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/flexiblespace_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/ratingbar_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HotelsCubit>()..getHotels(),
      child: BlocBuilder<HotelsCubit, HotelsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HotelsCubit>(context);
          return Scaffold(
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    collapsedHeight: 400,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceWidget(cubit.images),
                  )
                ];
              },
              body: Container(
                color: AppColors.baseColor,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cardColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CachedNetworkImage(
                              imageUrl: AppApis.getImageUrl(
                                  cubit.images[index].toString()),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.hotels[index].hotelName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      cubit.hotels[index].hotelAddress,
                                      style: const TextStyle(
                                          color: AppColors.borderSideColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, right: 30),
                                      child: Row(
                                        children: [
                                          const RatingBarWidget(),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                  '\$' +
                                                      cubit.hotels[index]
                                                          .hotelPrice,
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
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                    );
                  },
                  itemCount: cubit.hotels.length,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
