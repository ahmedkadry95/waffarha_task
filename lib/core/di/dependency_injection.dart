import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:waffarha_task/core/networking/api_helper.dart';
import 'package:waffarha_task/core/networking/network_checker.dart';
import 'package:waffarha_task/features/home/data/data_source/home_remote_data_sources.dart';
import 'package:waffarha_task/features/home/data/repository/home_repo_impl.dart';
import 'package:waffarha_task/features/home/domain/use_cases/get_photo_use_case.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Others
  getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());

  /// Cubits
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());

  /// Use cases
  getIt.registerLazySingleton<GetPhotosUseCase>(() => GetPhotosUseCase());

  /// Repositories Implementation
  getIt.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl());

  /// Data source Implementation
  getIt.registerLazySingleton<HomeRemoteDataSourcesImpl>(
      () => HomeRemoteDataSourcesImpl());

  ///check internet connection
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  getIt.registerLazySingleton<NetworkCheckerImpl>(
      () => NetworkCheckerImpl(connectionChecker: getIt()));
}
