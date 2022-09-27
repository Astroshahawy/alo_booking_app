import 'package:alo_booking_app/core/network/dio_helper.dart';
import 'package:alo_booking_app/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:alo_booking_app/features/authentication/data/repository/auth_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:alo_booking_app/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:alo_booking_app/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:alo_booking_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:alo_booking_app/features/hotels/data/data_source/base_hotels_data_source.dart';
import 'package:alo_booking_app/features/hotels/data/repository/hotels_repository.dart';
import 'package:alo_booking_app/features/hotels/domain/repository/base_hotel_repository.dart';
//import 'package:alo_booking_app/features/hotels/domain/use_cases/get_hotels_use_case.dart';
import 'package:alo_booking_app/features/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:alo_booking_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:alo_booking_app/features/profile/data/repository/profile_repository_impl.dart';
import 'package:alo_booking_app/features/profile/domain/repository/profile_repository.dart';
import 'package:alo_booking_app/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:alo_booking_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alo_booking_app/features/search_hotels/domain/use_cases/get_facilities_use_case.dart';
import 'package:alo_booking_app/features/search_hotels/domain/use_cases/search_hotel_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/profile/domain/use_cases/update_profile_use_case.dart';
import '../../features/search_hotels/data/data_source/search_hotels_remote_data_source.dart';
import '../../features/search_hotels/data/repository/search_hotels_repository_impl.dart';
import '../../features/search_hotels/domain/repository/search_hotel_repository.dart';
import '../../features/search_hotels/domain/use_cases/get_hotels_use_case.dart';
import '../../features/search_hotels/presentation/cubit/search_hotels_cubit.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

void initGetIt() {
  /// BLoC
  getIt.registerFactory(() => AuthBloc(getIt(), getIt()));
  getIt.registerFactory(() => HotelsCubit(getIt()));
  getIt.registerFactory(() => ProfileBloc(getIt(), getIt()));
  getIt.registerFactory(() => SearchHotelsBloc(getIt(),getIt(), getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  //getIt.registerLazySingleton(() => GetHotelsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProfileInfo(profileRepository: getIt()));
  getIt.registerLazySingleton(
      () => UpdateProfileInfo(updateProfileRepository: getIt()));
  getIt.registerLazySingleton(
      () => SearchHotelsInfo(searchHotelsRepository: getIt()));
  getIt.registerLazySingleton(
          () => GetHotelsUseCase(getIt()));
  getIt.registerLazySingleton(
          () => GetFacilitiesInfo(getFacilitiesRepository: getIt()));

  /// Repository
  getIt
      .registerLazySingleton<BaseAuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<BaseHotelRepository>(
      () => HotelsRepository(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
      networkInfo: getIt(), profileRemoteDataSource: getIt()));
  getIt.registerLazySingleton<SearchHotelsRepository>(() =>
      SearchHotelsRepositoryImpl(
          networkInfo: getIt(), searchHotelsRemoteDataSource: getIt()));

  /// DataSource
  getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton<BaseHotelsRemoteDataSource>(
      () => HotelsRemoteDataSource(getIt()));
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<SearchHotelsRemoteDataSource>(
      () => SearchHotelsRemoteDataSourceImpl(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  /// External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
