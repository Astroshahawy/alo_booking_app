import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:alo_booking_app/features/search_hotels/domain/entities/facilities_data.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/presentation/cubit/search_hotels_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularFilterWidget extends StatefulWidget {
  PopularFilterWidget({Key? key}) : super(key: key);
  @override
  State<PopularFilterWidget> createState() => _PopularFilterWidgetState();
}

class _PopularFilterWidgetState extends State<PopularFilterWidget> {
  FacilitiesData? filterComponents;
  late List<bool> selectedComponents;
  List<String> selectedfacilities = [];
  @override
  void initState() {
    // final bloc = SearchHotelsBloc.get(context);
    // bloc.getFacilities();
    // filterComponents =
    //     SearchHotelsBloc.facilities;
    selectedComponents = List.filled( SearchHotelsBloc.facilities!.data!.length, false);
    selectedfacilities = List.filled(SearchHotelsBloc.facilities!.data!.length, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      BlocBuilder<SearchHotelsBloc,SearchHotelsState>(
      builder: (context, state) {
      if(state is GetFacilitiesSuccessState){
        filterComponents =
            SearchHotelsBloc.facilities;
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
      return CircularProgressIndicator();
    },);
  }

  filterComponent() {
    return GridView.builder(
      shrinkWrap: true,primary: false,
      itemCount: filterComponents!.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: AppColors.defaultColor,
                  checkColor: AppColors.baseColor,
                  side: BorderSide(width: 2,color: AppColors.borderSideColor),
                  value: this.selectedComponents[index],
                  onChanged: (bool? value) {
                    setState(() {
                      this.selectedComponents[index] = value!;
                      if(value == true){
                        selectedfacilities[index] = filterComponents!.data![index].id.toString();
                      }else{
                        this.selectedfacilities[index] = '';
                      }
                      SearchHotelsBloc.get(context).selectFacilities(selectedfacilities);
                      //print(this.selectedfacilities.toString());
                    });
                  },
                ),
                Text('${filterComponents!.data![index].name}')
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
