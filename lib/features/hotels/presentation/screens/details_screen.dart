import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_appbar_background_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_to_box_adapter_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ScrollController scrollController = ScrollController();
  double offset = 0;
 
  @override
  Widget build(BuildContext context) {
    debugPrint(
        (1 - (offset / (MediaQuery.of(context).size.height - 200))).toString());
    Hotels hotel = ModalRoute.of(context)!.settings.arguments as Hotels;
    return Scaffold(
        backgroundColor: AppColors.baseColor,
        body: Hero(
          tag: hotel,
          child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  elevation: 0.0,
                  pinned: true,
                  collapsedHeight: 200,
                  expandedHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.top,
                  actions: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        backgroundColor: AppColors.baseColor,
                        radius: 20,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: AppColors.defaultColor,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white54,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.baseColor,
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: StatefulBuilder(
                    builder: (context, setState) {
                      scrollController.addListener(() {
                       
                        setState.call((() => offset = scrollController.offset));
                          
                        
                      });
                      return SliverAppbarBackgroundWidget(
                        hotel: hotel,
                        offset: offset,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SliverToBoxAdaptorWidget(
                    hotel: hotel,
                  ),
                )
              ]),
        ));
  }
}
