import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/Data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    remoteDataSource:
        HomeRemoteDataSourceImpl(apiServices: getIt.get<ApiServices>()),
    localDataSource: HomeLocalDataSourceImpl(),
  ));
}
