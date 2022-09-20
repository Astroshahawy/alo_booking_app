import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/datasource/booking_remote_data_source.dart';
import 'package:alo_booking_app/features/authentication/data/repository/home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_cubit.dart';
import 'package:alo_booking_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:alo_booking_app/features/profile/data/repository/profile_repository_impl.dart';
import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:alo_booking_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/network_info.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory(() => BookingBloc(getIt()));
  getIt.registerFactory(() => ProfileBloc(getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProfileInfo(profileRepository: getIt()));


  /// Repository
  getIt.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() =>
      ProfileRepositoryImpl(networkInfo: getIt(),
      profileRemoteDataSource: getIt()));

  /// DataSource
  getIt.registerLazySingleton<BaseBookingRemoteDataSource>(() => BookingRemoteDataSource(getIt()));
  getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  /// External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
