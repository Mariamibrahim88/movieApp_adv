import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_adv/core/utils/functions/api_service.dart';
import 'package:movie_app_adv/features/Auth/data/repo/auth_repo_impl.dart';

import '../../../features/Auth/data/repo/auth_repo.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  //getIt.registerSingleton<AuthRepoImpl>(getIt.get<AuthRepoImpl>());
  //getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));

  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
