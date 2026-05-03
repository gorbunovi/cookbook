import 'package:cookbook/routes/app_pages.dart';
import 'package:cookbook/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const RusticRecipesApp());
}

class RusticRecipesApp extends StatelessWidget {
  const RusticRecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Rustic Recipes',

      initialRoute: AppRoutes.catalog,
      getPages: AppPages.pages,

      /// ❌ ВРЕМЕННО УБРАТЬ ВСЁ DI
      /// initialBinding: REMOVE
    );
  }
}