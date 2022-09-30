import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';
import 'package:alo_booking_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alo_booking_app/features/profile/presentation/widgets/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../authentication/domain/entities/user.dart';
import '../../../../authentication/presentation/cubit/auth_cubit.dart';
import '../../widgets/divider_widget.dart';
import 'widget/update_profile_item_widget.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User userInfo = AuthBloc.get(context).auth.userData;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 68,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        if (userInfo.image.isEmpty)
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/user.jpg'),
                          ),
                        if (userInfo.image.isNotEmpty)
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                AppApis.getImageUrl(userInfo.image)),
                          ),
                        Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: () {
                              ImageHelper().selectAvatarOperation(context);
                            },
                            elevation: 2.0,
                            fillColor: const Color(0xFF4fbe9e),
                            padding: const EdgeInsets.all(5.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color(0xFF2c2c2c),
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                UpdateProfileItemWidget(
                  text: 'User name',
                  editable: true,
                  controller: nameController,
                  subText: userInfo.name,
                ),
                const DividerWidget(),
                UpdateProfileItemWidget(
                  text: 'Email',
                  editable: true,
                  controller: emailController,
                  subText: userInfo.email,
                ),
                const DividerWidget(),
                const UpdateProfileItemWidget(
                  text: 'Phone',
                  subText: '+20 1587895949',
                ),
                const DividerWidget(),
                UpdateProfileItemWidget(
                  text: 'Date created',
                  subText: formatDate(userInfo.createdAt),
                ),
                const DividerWidget(),
                UpdateProfileItemWidget(
                  text: 'Last updated',
                  subText: formatDate(userInfo.updatedAt),
                ),
                const DividerWidget(),
                const SizedBox(
                  height: 50,
                ),
                BouncingButton(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  onPress: () {
                    ProfileBloc.get(context).updateProfile(
                      updateProfileInfoParameters: UpdateProfileInfoParameters(
                        token:
                            'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
                        updateProfile: UpdateProfile(
                            email: 'abdullaaah.mansoour@gmail.com',
                            name: 'Abdullaaah Mansoour',
                            image: ProfileBloc.imageProfile),
                      ),
                    );
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatDate(String date) {
  return DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.parse(date));
}
