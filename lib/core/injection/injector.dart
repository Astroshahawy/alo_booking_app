import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/datasource/booking_remote_data_source.dart';
import 'package:alo_booking_app/features/authentication/data/repository/home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_home_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/booking_cubit.dart';
import 'package:alo_booking_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:alo_booking_app/features/profile/data/repository/profile_repository_impl.dart';
import 'package:alo_booking_app/features/profile/domain/entities/update_profile.dart';
import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:alo_booking_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/domain/usecases/profile_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/profile/domain/usecases/update_profile_usecase.dart';
import '../../features/search_hotels/data/datasource/search_hotels_remote_data_source.dart';
import '../../features/search_hotels/data/repository/search_hotels_repository_impl.dart';
import '../../features/search_hotels/domain/repository/search_hotel_repository.dart';
import '../../features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory(() => BookingBloc(getIt()));
  getIt.registerFactory(() => ProfileBloc(getIt(),getIt()));
  getIt.registerFactory(() => SearchHotelsBloc(getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  /// usecase of profile
  getIt.registerLazySingleton(() => GetProfileInfo(profileRepository: getIt()));
  getIt.registerLazySingleton(() => UpdateProfileInfo(updateProfileRepository: getIt()));
  /// usecase of search about hotels
  getIt.registerLazySingleton(() => SearchHotelsInfo(searchHotelsRepository: getIt()));


  /// Repository
  getIt.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(getIt()));
  /// Repository of profile
  getIt.registerLazySingleton<ProfileRepository>(() =>
      ProfileRepositoryImpl(networkInfo: getIt(),
      profileRemoteDataSource: getIt()));
  /// Repository of search about hotels
  getIt.registerLazySingleton<SearchHotelsRepository>(() =>
      SearchHotelsRepositoryImpl(networkInfo: getIt(),
          searchHotelsRemoteDataSource: getIt()));

  /// DataSource
  getIt.registerLazySingleton<BaseBookingRemoteDataSource>(() => BookingRemoteDataSource(getIt()));
  /// DataSource of profile
  getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(getIt()));
  /// DataSource of search about hotels
  getIt.registerLazySingleton<SearchHotelsRemoteDataSource>(() => SearchHotelsRemoteDataSourceImpl(getIt()));


  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  /// External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
