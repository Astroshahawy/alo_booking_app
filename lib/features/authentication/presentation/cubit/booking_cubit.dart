import 'package:alo_booking_app/features/authentication/domain/entities/auth.dart';
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_state.dart';

class BookingBloc extends Cubit<BookingState> {
  final LoginUseCase loginUseCase;

  BookingBloc(
    this.loginUseCase,
  ) : super(BookingInitialState());

  static BookingBloc get(context) => BlocProvider.of<BookingBloc>(context);

  late Login login;
  Future<void> userLogin() async {
    emit(UserLoginLoadingState());

    final response = await loginUseCase(
      const Auth(
        email: 'abdullah.mansour@gmail.com',
        password: '123456',
      ),
    );

    response.fold(
      (left) {
        emit(ErrorState(exception: left));
      },
      (right) {
        login = right;
        emit(UserLoginSuccessState());
      },
    );
  }
}
