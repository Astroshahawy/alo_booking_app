
import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';


class RangeSliderWidget extends StatefulWidget {
  RangeSliderWidget({Key? key, required this.minPriceController, required this.maxPriceController}) : super(key: key);
  TextEditingController minPriceController;
  TextEditingController maxPriceController;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {

  RangeValues _currentRangeValues = const RangeValues(10, 5000);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Text('price (for 1 night)', style: TextStyle(color: AppColors.borderSideColor,fontSize: 16)),
        ),
        const SizedBox(height: 3,),
        RangeSlider(
          activeColor: AppColors.defaultColor,
          inactiveColor: AppColors.borderSideColor,
          values: _currentRangeValues,
          min: 10,
          max: 5000,
          divisions: 2500,
          labels: RangeLabels(
            '${_currentRangeValues.start.round().toString()}\$',
            '${_currentRangeValues.end.round().toString()}\$',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              widget.minPriceController.text = values.start.round().toString() ;
              widget.maxPriceController.text = values.end.round().toString() ;
            });
          },
        ),
      ],
    );
  }
}
