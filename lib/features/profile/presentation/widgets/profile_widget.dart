import 'package:alo_booking_app/features/profile/data/models/update_profile_model.dart';
import 'package:alo_booking_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_helper.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseDioHelper? baseDioHelper;
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // await DioHelper().get(
                  //   endPoint: AppApis.profileEndPoint,
                  //   token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
                  // );
                  ProfileBloc.get(context).getProfile(context);
                },
                child: const Text('Profile'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // await DioHelper().get(
                  //   endPoint: AppApis.profileEndPoint,
                  //   token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
                  // );
                  ProfileBloc.get(context).updateProfile(
                    updateProfileInfoParameters:
                        const UpdateProfileInfoParameters(
                      token:
                          'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
                      updateProfile: UpdateProfileModel(
                          name: 'Abdullaah Mansour',
                          email: 'abdullaah.mansour@gmail.com'),
                    ),
                  );
                },
                child: const Text('Profile'),
              ),
            ),
          ],
        );
      },
    );
  }
}
