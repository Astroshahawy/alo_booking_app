
import 'package:alo_booking_app/features/authentication/domain/entities/login.dart';
import 'package:alo_booking_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/update_profile_model.dart';
import '../../domain/usecases/update_profile_usecase.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final GetProfileInfo getProfileInfo;
  final UpdateProfileInfo updateProfileInfo;

  ProfileBloc(
    this.getProfileInfo,
      this.updateProfileInfo,
  ) : super(ProfileInitialState());

  static ProfileBloc get(context) => BlocProvider.of<ProfileBloc>(context);

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

  void updateProfile({required String token, required UpdateProfileModel upadetProfileModel}) async {
    emit(UserProfileLoadingState());

    final response = await updateProfileInfo(token, upadetProfileModel);

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
