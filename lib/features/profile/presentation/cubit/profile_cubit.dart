import 'dart:io';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile.dart';
import '../../domain/use_cases/update_profile_use_case.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final GetProfileInfo getProfileInfo;
  final UpdateProfileInfo updateProfileInfo;

  static late Profile profileInfo;

  ProfileBloc(
    this.getProfileInfo,
    this.updateProfileInfo,
  ) : super(ProfileInitialState());

  static ProfileBloc get(context) => BlocProvider.of<ProfileBloc>(context);

  void getProfile(context) async {
    emit(UserProfileLoadingState());

    final response = await getProfileInfo(AuthBloc.get(context).auth.userData.token);

    return response.fold(
      (l) {
        emit(ProfileErrorState(exception: l));
      },
      (r) {
        profileInfo = r;
        print(r);
        emit(UserProfileSuccessState(r.data));
      },
    );
  }

  void updateProfile(
      {required UpdateProfileInfoParameters
          updateProfileInfoParameters}) async {
    emit(ImageUploadingState());
    print(updateProfileInfoParameters.toString());
    final response = await updateProfileInfo(updateProfileInfoParameters);

    return response.fold(
      (l) {
        emit(ProfileErrorState(exception: l));
      },
      (r) {
        profileInfo = r;
        print(r);
        emit(UserProfileSuccessState(r.data));
      },
    );
  }

  static late File imageProfile;
  saveImage(File image){
    imageProfile = image;
    print(image.path.toString()+"sssssssssssssssssssssssssss");
    emit(ImageUploadedState(image));
  }
}
