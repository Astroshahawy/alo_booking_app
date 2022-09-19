import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_cubit.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            onPressed: () {
              BookingBloc.get(context).userLogin();
            },
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}
