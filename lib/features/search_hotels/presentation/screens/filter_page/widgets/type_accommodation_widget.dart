import 'package:alo_booking_app/core/themes/app_colors.dart';
import 'package:alo_booking_app/core/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/constants/constants.dart';

class TypeAccommodationWidget extends StatefulWidget {
  const TypeAccommodationWidget({Key? key}) : super(key: key);

  @override
  State<TypeAccommodationWidget> createState() =>
      _TypeAccommodationWidgetState();
}

class _TypeAccommodationWidgetState extends State<TypeAccommodationWidget> {
  List<String> typeAccommodations = [
    'All',
    'Room',
    'Villa',
    'Apartment',
    'Home'
  ];
  List<bool>? selectedType;
  @override
  void initState() {
    selectedType = List.filled(typeAccommodations.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of Accommodation',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              letterSpacing: 0.5,
              color: AppThemeBloc.get(context).isDarkMode
                  ? AppDarkColors.accentColor2
                  : AppLightColors.accentColor2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: typesAccommodationWidget(),
          ),
        ],
      ),
    );
  }

  typesAccommodationWidget() {
    return Column(
      children: List.generate(
        typeAccommodations.length,
        (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(typeAccommodations[index]),
              SizedBox(
                height: 50,
                child: CupertinoSwitch(
                  activeColor: AppColors.defaultColor,
                  trackColor: AppThemeBloc.get(context).isDarkMode
                      ? AppDarkColors.accentColor
                      : AppLightColors.accentColor2,
                  value: selectedType![index],
                  onChanged: (bool? value) {
                    setState(
                      () {
                        typeAccommodations[index] == 'All'
                            ? selectedType!.fillRange(0, 5, value!)
                            : selectedType![index] = value!;
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  switchButton() {
    return Container();
  }
}
