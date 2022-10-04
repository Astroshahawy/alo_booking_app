import 'package:alo_booking_app/features/hotels/domain/entities/hotels.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_appbar_background_widget.dart';
import 'package:alo_booking_app/features/hotels/presentation/widgets/details_widgets/sliver_to_box_adapter_widget.dart';
import 'package:flutter/material.dart';

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
    Hotels hotel = ModalRoute.of(context)!.settings.arguments as Hotels;
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            collapsedHeight: 200,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
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
        ],
      ),
    );
  }
}
