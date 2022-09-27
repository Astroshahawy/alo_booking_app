
import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_state.dart';
import 'package:alo_booking_app/features/profile/presentation/screens/update_page/update_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/divider_widget.dart';
import 'widget/profile_items_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.baseColor,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  UpdateProfilePage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
                  // height: 100,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.white),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            child: Text(
                              "Amanda",
                            ),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                              color: Color(0xFF727272),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            child: Text(
                              "View and Edit Profile",
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            //Image.asset('asset/food2.png'),
                            NetworkImage(
                                "http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                        backgroundColor: Colors.transparent,
                      )
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 15,),
              profileItemsWidget(text: "change Password", icon: Icons.lock,),
              dividerWidget(30, 30,0),
              profileItemsWidget(icon:Icons.people_rounded, text:"invite Froend"),
              dividerWidget(30, 30,0),
              profileItemsWidget(icon:Icons.wallet_giftcard_rounded, text:"Credit & Coupons"),
              dividerWidget(30, 30,0),
              profileItemsWidget(icon:Icons.error_outlined, text:"Help Center"),
              dividerWidget(30, 30,0),
              profileItemsWidget(icon:Icons.payment, text:"Payment"),
              dividerWidget(30, 30,0),
              profileItemsWidget(icon:Icons.settings, text:"Setting"),
              dividerWidget(30, 30,0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    BlocBuilder<AppThemeBloc, AppThemeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                          activeColor: AppColors.defaultColor,
                          trackColor: AppDarkColors.accentColor1,
                          value: AppThemeBloc.get(context).isDarkMode,
                          onChanged: (value) =>
                              AppThemeBloc.get(context).toggleTheme(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
