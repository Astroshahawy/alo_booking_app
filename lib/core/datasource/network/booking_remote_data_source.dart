import 'package:alo_booking_app/features/authentication/data/models/auth_model.dart';
import 'package:alo_booking_app/features/authentication/data/models/login_model.dart';
import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'booking_remote_data_source.g.dart';

@RestApi(baseUrl: AppApis.baseUrl)
abstract class BookingRemoteDataSource {
  factory BookingRemoteDataSource(Dio dio, {String baseUrl}) =
      _BookingRemoteDataSource;

  @POST(AppApis.version + AppApis.loginEndPoint)
  Future<LoginModel> login(@Body() AuthModel auth);
}
