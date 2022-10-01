import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/flexiblespace_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/hotels_widgets/ratingbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    stretch: true,
                    floating: true,
                    collapsedHeight: 150,
                    expandedHeight: 400,
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
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.detailsScreen,
                            arguments: cubit.hotels[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cardColor.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
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
                                      child: CircularProgressIndicator(color: AppColors.defaultColor,)),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.hotels[index].hotelName,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          maxLines: 1,
                                        ),
                                        Text(
                                          cubit.hotels[index].hotelAddress,
                                          style: const TextStyle(
                                              color: AppColors.borderSideColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 3,
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, right: 30),
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
                        ),
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
