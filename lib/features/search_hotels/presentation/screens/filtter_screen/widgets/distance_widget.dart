
import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';

class DistanceWidget extends StatefulWidget {
  const DistanceWidget({Key? key}) : super(key: key);

  @override
  State<DistanceWidget> createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {

  int _value = 5;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Text('Distance from city center', style: TextStyle(color: AppColors.borderSideColor,fontSize: 15),),
          ),
          slider(),
        ],
      ),
    );
  }
  slider(){
    return Slider(
        value: _value.toDouble(),
        min: 0.0,
        max: 10.0,
        divisions: 100,
        activeColor: AppColors.defaultColor,
        inactiveColor: AppColors.borderSideColor,
        label: 'Less than ${_value} km',
        onChanged: (double newValue) {
          setState(() {
            _value = newValue.round();
          });
        },
        semanticFormatterCallback: (double newValue) {
          return '${newValue.round()} dollars';
        }
    );
  }
}
