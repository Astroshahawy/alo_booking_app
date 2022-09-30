import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/widgets/bouncing_button.dart';
import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';
import 'package:alo_booking_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alo_booking_app/features/profile/presentation/widgets/image_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../authentication/domain/entities/user.dart';
import '../../../../authentication/presentation/cubit/auth_cubit.dart';
import '../../widgets/divider_widget.dart';
import 'widget/update_profile_item_widget.dart';

class UpdateProfilePage extends StatelessWidget {
   UpdateProfilePage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  Widget build(BuildContext context){
    User userInfo = AuthBloc.get(context).auth.userData;
    return Scaffold(
      //backgroundColor: Color(0xFF1a1a1a),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      //color: Colors.white,
                    )),
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        //color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
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
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            userInfo.image != '' ? AppApis.getImageUrl(userInfo.image):
                              "http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: () {
                                ImageHelper().selectAvatarOperation(context);
                              },
                              elevation: 2.0,
                              fillColor: Color(0xFF4fbe9e),
                              child: Icon(
                                Icons.camera_alt,
                                color: Color(0xFF2c2c2c),
                                size: 18,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UpdateProfileItemWidget(text: "UserName", controller: nameController,hintText: "${userInfo.name}"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Email", controller:emailController, hintText:"${userInfo.email}"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Phone", controller:phoneController, hintText:"+95936575739"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Date of Birth", controller:dateOfBirthController, hintText:"20,sep 2020"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Address", controller:addressController,hintText:"egypt, cairo"),
                dividerWidget(15, 15,1),

                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: BouncingButton(
                      child: Text('Update'),
                      onPress: (){
                        ProfileBloc.get(context).updateProfile(
                            updateProfileInfoParameters:
                            UpdateProfileInfoParameters(token: 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
                                updateProfile: UpdateProfile(email: 'abdullaaah.mansoour@gmail.com',name: 'Abdullaaah Mansoour', image: ProfileBloc.imageProfile))
                        );
                      },
                      height: 52,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
