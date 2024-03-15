import 'package:dio/dio.dart';
import 'package:gatitapp/data/constants.dart';
import 'package:gatitapp/data/datasources/cats_datasource.dart';
import 'package:gatitapp/data/repository/cat_repository_impl.dart';
import 'package:gatitapp/domain/repository/cat_repository.dart';
import 'package:gatitapp/domain/use%20case/fetch_cats_use_case.dart';
import 'package:gatitapp/presentation/cat_list/cubit/cats_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  //cubit
  serviceLocator.registerLazySingleton<CatsCubit>(
    () => CatsCubit(
      fetchCatsUseCase: serviceLocator(),
    ),
  );
  //use case
  serviceLocator.registerLazySingleton<FetchCatsUseCase>(
      () => FetchCatsUseCase(repository: serviceLocator()));
  //repository
  serviceLocator.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );
  //dataSources
  serviceLocator.registerLazySingleton<CatsDataSource>(
    () => CatsDataSourceImpl(
      dio: serviceLocator(),
    ),
  );
  //external
  final dio = Dio(BaseOptions(baseUrl: ConstApp.urlBase.name, headers: {
    "x-api-key": ConstApp.headers.name,
  }));
  serviceLocator.registerLazySingleton<Dio>(() => dio);
}
