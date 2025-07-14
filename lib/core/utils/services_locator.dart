import 'package:book_store_app/core/utils/api_services.dart';
import 'package:book_store_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // getIt.registerSingleton<Dio>(
  //   Dio(
  //     BaseOptions(
  //       baseUrl: 'https://www.googleapis.com/books/v1/',
  //       connectTimeout: const Duration(seconds: 10),
  //       receiveTimeout: const Duration(seconds: 10),
  //     ),
  //   ),
  // );
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
}
