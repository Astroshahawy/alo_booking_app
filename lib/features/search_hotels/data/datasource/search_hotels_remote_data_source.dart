
import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/search_hotels_model.dart';
import 'package:alo_booking_app/features/search_hotels/data/models/search_options_model.dart';
import '../../../../core/constants/constants.dart';

abstract class SearchHotelsRemoteDataSource {
  Future<SearchHotelsModel> searchHotelsInfo(SearchOptionsModel searchOptionsModel);
}

class SearchHotelsRemoteDataSourceImpl extends SearchHotelsRemoteDataSource {
  final BaseDioHelper baseDioHelper;

  SearchHotelsRemoteDataSourceImpl(this.baseDioHelper);

  @override
  Future<SearchHotelsModel> searchHotelsInfo(SearchOptionsModel searchOptionsModel) async{
    final response = await baseDioHelper.get(
      endPoint: AppApis.searchHotelsEndPoint,
      query: searchOptionsModel.toJson(),
    );
    return SearchHotelsModel.fromJson(response);

  }



}
