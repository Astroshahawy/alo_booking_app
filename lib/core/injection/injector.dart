import 'package:alo_booking_app/core/datasource/network/booking_remote_data_source.dart';
import 'package:alo_booking_app/core/datasource/network/dio_helper.dart';
import 'package:alo_booking_app/features/feature/data/repository/home_repository.dart';
import 'package:alo_booking_app/features/feature/domain/repository/base_home_repository.dart';
import 'package:alo_booking_app/features/feature/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  // getIt.registerFactory(() => HomeWeatherBloc(getIt(), getIt(), getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  /// Repository
  getIt
      .registerLazySingleton<BaseHomeRepository>(() => HomeRepository(getIt()));

  /// DataSource
  getIt.registerLazySingleton(() => BookingRemoteDataSource(dioHelper()));
}
