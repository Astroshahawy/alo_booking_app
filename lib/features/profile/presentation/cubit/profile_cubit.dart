
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final  GetProfileInfo getProfileInfo;

  ProfileBloc(
    this.getProfileInfo,
  ) : super(ProfileInitialState());

  static ProfileBloc get(context) => BlocProvider.of<ProfileBloc>(context);

  late Login login;
  void getProfile({required String token}) async {
    emit(UserProfileLoadingState());

    final response = await getProfileInfo(token);

    return response.fold(
          (l) {
        emit(ProfileErrorState(exception: l));
      },
          (r) {
        //profileModel = r;
            print(r);
        emit(UserProfileSuccessState());
      },
    );
  }
}
