
import 'dart:io';

import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../cubit/profile_cubit.dart';

class ImageHelper {


  final picker = ImagePicker();

  File ? userAvatar;
  File get getUserAvatar => userAvatar!;

  Future pickerUserAvatar(BuildContext context, ImageSource source) async{
    final pickedUserAvatar  =await picker.getImage(source: source);
    pickedUserAvatar == null ? print('select Image') : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar!.path);

    userAvatar != null ? showUserAvatar(context)
        : print('Image upload error');
  }

  Future selectAvatarOperation(BuildContext context) async{
    return showModalBottomSheet(
        backgroundColor: AppColors.baseColor,
        context: context, builder: (context){
      return Container(

        height: 70,//MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
        ),
        child: Column(

          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.41),
              child: Divider(
                thickness: 4,
                color: AppColors.borderSideColor,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: AppColors.cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: (){

                    pickerUserAvatar(context, ImageSource.gallery).whenComplete((){
                      Navigator.pop(context);
                      showUserAvatar(context);
                    });
                  },
                  child: Text('Gallery',style: TextStyle(
                    //color: AppColors.,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                ),

                MaterialButton(
                  color: AppColors.cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: (){
                    pickerUserAvatar(context, ImageSource.camera).whenComplete((){
                      Navigator.pop(context);
                      showUserAvatar(context);
                    });
                  },
                  child: Text('Camera',style: TextStyle(
                    //color: constantColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                ),
              ],
            ),
          ],
        ),

      );
    });
  }

  showUserAvatar(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: AppColors.baseColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: constantColors.yellowColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: AppColors.borderSideColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.borderSideColor,
                  backgroundImage: FileImage(
                    userAvatar!,
                  ),
                  radius: 60,
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          selectAvatarOperation(context).whenComplete((){
                            Navigator.pop(context);
                          });
                          Navigator.pop(context);
                          //pickerUserAvatar(context, ImageSource.gallery);
                        },
                        child: Text(
                          'Reselect',
                          style: TextStyle(
                            ///color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.borderSideColor,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: AppColors.defaultColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Confirme Image',
                            style: TextStyle(
                              //color: constantColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () {
                          ProfileBloc.get(context).saveImage(userAvatar!);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

}