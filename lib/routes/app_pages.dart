import 'package:cookbook/core/logging/app_logger.dart';
import 'package:cookbook/feature/presentation/pages/catalog_page.dart';
import 'package:cookbook/feature/presentation/pages/recipe_page.dart';
import 'package:get/get.dart';


import 'app_routes.dart';

/// Центральная конфигурация маршрутов GetX
class AppPages {
  static final List<GetPage> pages = [
    /// 📁 Каталог
    GetPage(
      name: AppRoutes.catalog,
      page: () => const CatalogPage(),
    ),

    /// 📖 Рецепт (через recipeId)
    GetPage(
      name: AppRoutes.recipe,
      page: () {
        AppLogger.d("ROUTE: RecipePage opened");
        return RecipePage();
      },
    ),
  ];
}