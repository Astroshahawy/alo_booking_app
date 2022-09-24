import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PopularFilterWidget extends StatefulWidget {
  const PopularFilterWidget({Key? key}) : super(key: key);

  @override
  State<PopularFilterWidget> createState() => _PopularFilterWidgetState();
}

class _PopularFilterWidgetState extends State<PopularFilterWidget> {
  List<String> filterComponents = ['wifi', 'gem', 'cinema', 'gem', 'cinema'];
  List<bool>? selectedComponents;
  @override
  void initState() {
    selectedComponents = List.filled(filterComponents.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular filter', style: TextStyle(color: AppColors.borderSideColor,fontSize: 15),),
            const SizedBox(height: 5,),
            filterComponent(),
          ],
        ),
      ),
    );
  }

  filterComponent() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: filterComponents.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: AppColors.defaultColor,
                  checkColor: AppColors.baseColor,
                  side: BorderSide(width: 2,color: AppColors.borderSideColor),
                  value: this.selectedComponents![index],
                  onChanged: (bool? value) {
                    setState(() {
                      this.selectedComponents![index] = value!;
                    });
                  },
                ),
                Text('${filterComponents[index]}')
              ]),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
         mainAxisSpacing: 1.0,
        childAspectRatio: 5,
      ),
    );
  }
}
