import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_helper.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

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
        return Center(
          child: ElevatedButton(
            onPressed: () async{
              // await DioHelper().get(
              //   endPoint: AppApis.profileEndPoint,
              //   token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
              // );
              ProfileBloc.get(context).getProfile(token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u');
            },
            child: const Text('Profile'),
          ),
        );
      },
    );
  }
}