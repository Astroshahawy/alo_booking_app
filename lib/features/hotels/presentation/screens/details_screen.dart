import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_appbar_background_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_to_box_adapter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hotels hotel = ModalRoute.of(context)!.settings.arguments as Hotels;
    return Scaffold(
        backgroundColor: AppColors.baseColor,
        body: Hero(
          tag: hotel,
          child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
            SliverAppBar(
                floating: false,
                elevation: 0.0,
                pinned: true,
                stretch: true,
                collapsedHeight: 200,
                backgroundColor: Colors.transparent,
                snap: false,
                expandedHeight: MediaQuery.of(context).size.height,
                actions: const [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  onTap: (){
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
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: SliverAppbarBackgroundWidget(
                   hotel: hotel,
                  ),
                )),
            SliverToBoxAdapter(
              child: SliverToBoxAdaptorWidget(hotel: hotel,),
            )
          ]),
        ));
  }
}
