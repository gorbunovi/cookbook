import 'package:cookbook/core/core.dart';
import 'package:cookbook/core/services/rest/service/network_info.dart';
import 'package:cookbook/feature/data/datasources/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/repositories/catalog_repositories_impl.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:cookbook/feature/domain/usecases/get_catalog.dart';
import 'package:cookbook/feature/domain/usecases/get_home_catalog.dart';
import 'package:cookbook/feature/presentation/catalog/controller/index.dart';
import 'package:cookbook/feature/presentation/home/controller/home_controller.dart';
import 'package:cookbook/feature/presentation/recipe/controller/index.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {

  // Cubit
  sl.registerFactory(() => HomeController(getHomeCatalog:  sl()));
  sl.registerFactory(() => CatalogController());
  sl.registerFactory(() => RecipeController(getCatalogs: sl()));
  // sl.registerFactory(() => CatalogController());

  //UseCases
  sl.registerLazySingleton(() => GetCatalogs(sl()));
  sl.registerLazySingleton(() => GetHomeCatalog(sl()));

  //Repository
  sl.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(
      catalogLocalDataSorce: sl(),
      catalogRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CatalogLocalDataSorce>(
    () => CatalogLocalDataSorceImpl(),
  );

  sl.registerLazySingleton<CatalogRemoteDataSource>(
    () => CatalogRemoteDataSourceImpl(restService: sl()),
  );

  //Service
  sl.registerSingletonAsync<DatabaseService>(() async => await DatabaseService().init());
  sl.registerLazySingleton<RestService>(() => RestService(client: sl()));


  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
