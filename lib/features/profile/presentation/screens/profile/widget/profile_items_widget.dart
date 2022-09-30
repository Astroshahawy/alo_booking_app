import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/themes/cubit/app_theme_cubit.dart';

class profileItemsWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onpressed;
  final IconData icon;

  const profileItemsWidget({Key? key, required this.text, this.onpressed, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        //color: Colors.amberAccent,
        //ibr
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 56,
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$text",style: TextStyle(
              color: AppThemeBloc.get(context).isDarkMode ?Colors.white : AppColors.baseColor,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            ),
            Icon(icon,  color: Color(0xFF555555),size: 27,),
          ],
        ),
      ),
    );
  }
}
