import 'dart:io';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../cubit/profile_cubit.dart';

class ImageHelper {
  final picker = ImagePicker();

  File? userAvatar;
  File get getUserAvatar => userAvatar!;

  Future pickerUserAvatar(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.getImage(source: source);
    pickedUserAvatar == null
        ? print('select Image')
        : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar!.path);

    userAvatar != null ? showUserAvatar(context) : print('Image upload error');
  }

  Future selectAvatarOperation(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: AppThemeBloc.get(context).isDarkMode
          ? AppDarkColors.backgroundColor
          : AppLightColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  thickness: 4,
                  color: AppThemeBloc.get(context).isDarkMode
                      ? AppLightColors.accentColor2
                      : AppDarkColors.accentColor2,
                ),
              ),
              const SizedBox(height: 30),
              BouncingButton(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                color: AppColors.defaultColor,
                onPress: () {
                  pickerUserAvatar(context, ImageSource.gallery).whenComplete(
                    () {
                      Navigator.pop(context);
                      showUserAvatar(context);
                    },
                  );
                },
                child: const Text(
                  'Select From Gallery',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BouncingButton(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                color: AppColors.defaultColor,
                onPress: () {
                  pickerUserAvatar(context, ImageSource.camera).whenComplete(
                    () {
                      Navigator.pop(context);
                      showUserAvatar(context);
                    },
                  );
                },
                child: const Text(
                  'Select From Camera',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  showUserAvatar(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppThemeBloc.get(context).isDarkMode
          ? AppDarkColors.backgroundColor
          : AppLightColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  thickness: 4,
                  color: AppThemeBloc.get(context).isDarkMode
                      ? AppLightColors.accentColor2
                      : AppDarkColors.accentColor2,
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: AppColors.defaultColor,
                backgroundImage: FileImage(
                  userAvatar!,
                ),
                radius: 60,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: BouncingButton(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      color: AppColors.borderSideColor,
                      onPress: () {
                        selectAvatarOperation(context).whenComplete(() {
                          Navigator.pop(context);
                        });
                        Navigator.pop(context);
                        //pickerUserAvatar(context, ImageSource.gallery);
                      },
                      child: const Text(
                        'Reselect',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: BouncingButton(
                      color: AppColors.defaultColor,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      onPress: () {
                        ProfileBloc.get(context).saveImage(userAvatar!);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
