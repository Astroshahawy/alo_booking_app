import 'package:alo_booking_app/features/bookings/presentation/cubit/bookings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsBloc extends Cubit<BookingsState> {
  BookingsBloc() : super(BookingsInitialState());

  static BookingsBloc get(context) => BlocProvider.of<BookingsBloc>(context);
}
