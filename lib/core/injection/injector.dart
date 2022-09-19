import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/datasource/booking_remote_data_source.dart';
import 'package:alo_booking_app/features/authentication/data/repository/home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory(() => BookingBloc(getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  /// Repository
  getIt
      .registerLazySingleton<BaseHomeRepository>(() => HomeRepository(getIt()));

  /// DataSource
  getIt.registerLazySingleton<BaseBookingRemoteDataSource>(() => BookingRemoteDataSource(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());
}
