import 'package:alo_booking_app/core/injection/injector.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HotelsCubit>()..getHotels(),
      child: BlocBuilder<HotelsCubit, HotelsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HotelsCubit>(context);
          return Scaffold(
            body: Column(
              children: [
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('GET hotels'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
