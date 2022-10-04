import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/screens/explore_page/widget/sliver_appBar_widget.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SearchHotelsBloc.get(context).getHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SliverAppBarWidget(),
    );
  }
}
