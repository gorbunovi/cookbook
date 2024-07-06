import 'package:cookbook/core/core.dart';
import 'package:cookbook/core/services/rest/service/network_info.dart';
import 'package:cookbook/feature/data/datasources/catalog/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/catalog/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/datasources/save_cookbook/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/save_cookbook/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/datasources/search/local/local_data_source.dart';
import 'package:cookbook/feature/data/datasources/search/remote/remote_data_source.dart';
import 'package:cookbook/feature/data/repositories/catalog_repositories_impl.dart';
import 'package:cookbook/feature/data/repositories/save_cook_book_repository_impl.dart';
import 'package:cookbook/feature/data/repositories/search_recipe_repositories_impl.dart';
import 'package:cookbook/feature/domain/repositories/catalog_repository.dart';
import 'package:cookbook/feature/domain/repositories/save_cookbook.dart';
import 'package:cookbook/feature/domain/repositories/search_recipe_repositories.dart';
import 'package:cookbook/feature/domain/usecases/get_catalog.dart';
import 'package:cookbook/feature/domain/usecases/get_home_catalog.dart';
import 'package:cookbook/feature/domain/usecases/save_cookbook.dart';
import 'package:cookbook/feature/domain/usecases/search.dart';
import 'package:cookbook/feature/presentation/catalog/controller/index.dart';
import 'package:cookbook/feature/presentation/home/controller/home_controller.dart';
import 'package:cookbook/feature/presentation/recipe/controller/index.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {




  // Cubit
  sl.registerFactory(() => HomeController(
    getHomeCatalog:  sl(),
    getSearchCatalog: sl(),
    saveCookbook: sl(),
    )
  );
  sl.registerFactory(() => CatalogController(getSearchCatalog: sl()));
  sl.registerFactory(() => RecipeController(getCatalogs: sl()));
  // sl.registerFactory(() => CatalogController());

  //UseCases
  sl.registerLazySingleton(() => GetCatalogs(sl()));
  sl.registerLazySingleton(() => GetHomeCatalog(sl()));
  sl.registerLazySingleton(() => GetSearchCatalog(sl()));
  sl.registerLazySingleton(() => SaveCookbook(sl()));

  //Repository
  sl.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(
      catalogLocalDataSorce: sl(),
      catalogRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<SearchRecipeRepository>(
    () => SearchRecipeRepositoryImpl(
      searchCatalogLocalDataSorce: sl(),
      searchRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<SaveCookBookRepository>(
    () => SaveCookBookRepositoryImpl(
      saveCookBookLocalDataSorce: sl(),
      saveCookBookRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // LocalDataSorce
  sl.registerLazySingleton<CatalogLocalDataSource>(
    () => CatalogLocalDataSourceImpl(
      sharedPreferences: sl(),
      databaseService: sl(),
    ),
  );

  sl.registerLazySingleton<SearchCatalogLocalDataSorce>(
    () => SearchCatalogLocalDataSorceImpl(
      databaseService: sl(),
    ),
  );

  sl.registerLazySingleton<SaveCookBookLocalDataSorce>(
    () => SaveCookBookLocalDataSorceImpl(),
  );

  // RemoteDataSource
  sl.registerLazySingleton<CatalogRemoteDataSource>(
    () => CatalogRemoteDataSourceImpl(restService: sl()),
  );

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchCatalogRemoteDataSourceImpl(restService: sl()),
  );

  sl.registerLazySingleton<SaveCookBookRemoteDataSource>(
    () => SaveCookBookRemoteDataSourceImpl(
      restService: sl(),
      databaseService: sl(),
    ),
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  //Service
  final databaseService = await DatabaseService().init();
  sl.registerLazySingleton(() => databaseService);
  sl.registerLazySingleton<RestService>(() => RestService(client: sl()));

  //External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
