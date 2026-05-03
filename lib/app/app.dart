// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'bindings/initial_binding.dart'; // глобальный DI
// import '../routes/app_pages.dart'; // список страниц
// import 'routes/app_routes.dart'; // строки маршрутов
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Cookbook',
//
//       /// 🔥 глобальный DI (инициализация сервисов)
//       initialBinding: InitialBinding(),
//
//       /// 🔥 маршруты
//       getPages: AppPages.routes,
//       initialRoute: AppRoutes.home,
//
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }