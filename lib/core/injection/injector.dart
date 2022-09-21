import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:alo_booking_app/features/authentication/data/repository/auth_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/hotels/data/data_source/base_hotels_data_source.dart';
import 'package:alo_booking_app/features/hotels/data/repository/hotels_repository.dart';
import 'package:alo_booking_app/features/hotels/domain/repository/base_hotel_repository.dart';
import 'package:alo_booking_app/features/hotels/domain/use_cases/get_hotels_usecase.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory(() => AuthBloc(getIt(), getIt()));
  getIt.registerFactory(() => HotelsCubit(getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => GetHotelsUseCase(getIt()));

  /// Repository
  getIt
      .registerLazySingleton<BaseAuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<BaseHotelRepository>(
      () => HotelsRepository(getIt()));

  /// DataSource
  getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton<BaseHotelsRemoteDataSource>(
      () => HotelsRemoteDataSource(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());
}
