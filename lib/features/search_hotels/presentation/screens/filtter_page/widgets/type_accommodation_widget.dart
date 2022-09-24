
import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';

class TypeAccommodationWidget extends StatefulWidget {
  const TypeAccommodationWidget({Key? key}) : super(key: key);

  @override
  State<TypeAccommodationWidget> createState() => _TypeAccommodationWidgetState();
}

class _TypeAccommodationWidgetState extends State<TypeAccommodationWidget> {

  List<String> typeAcommodations = ['All', 'Room', 'villa','Apartment','Home'];
  List<bool>? selectedType;
  @override
  void initState() {
    selectedType = List.filled(typeAcommodations.length, false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Type of Accommodation', style: TextStyle(color: AppColors.borderSideColor,fontSize: 15),),
          Padding(padding: EdgeInsets.only(left: 6),child: typesAccommodatiosWidget(),),
        ],
      ),
    );
  }
  typesAccommodatiosWidget() {
    return Column(
      children: List.generate(typeAcommodations.length, (index) {
        return Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text('${typeAcommodations[index]}'),
                Container(
                  width: 50,height: 45,
                  child: Switch.adaptive(

                    activeColor: Colors.white,
                    activeTrackColor: AppColors.defaultColor,
                    inactiveTrackColor: AppColors.borderSideColor,
                    inactiveThumbColor: Colors.white,
                    value: this.selectedType![index],
                    onChanged: (bool? value) {
                      setState(() {
                        typeAcommodations[index] == 'All'? selectedType!.fillRange(0, 3,value!):
                        this.selectedType![index] = value!;
                      });
                    },
                  ),

                ),
              ]),
        );
      }),
    );
  }
  switchButton(){
    return Container(

    );
  }
}
