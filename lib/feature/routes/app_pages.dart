import 'package:cookbook/feature/presentation/catalog/view/catalog_page.dart';
import 'package:cookbook/feature/presentation/home/view/home_page.dart';
import 'package:cookbook/feature/presentation/ingridient/view/home_page.dart';
import 'package:cookbook/feature/presentation/recipe/view/recipe_page.dart';
import 'package:cookbook/feature/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:cookbook/core/core.dart' as core;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _defaultLocale = const Locale('ru', '');

  final List<LocalizationsDelegate<dynamic>> _localizationsDelegates = const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Кулинарная книга',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: core.AppMaterialColors.primarySwatch,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: core.AppColors.brow,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: core.AppColors.brow,
          labelStyle: core.TextStyles.textBrow16,
          unselectedLabelColor: const Color(0xFFD7C2A5),
          unselectedLabelStyle: core.TextStyles.textWite16
        )
      ),
      home: const MyHomePage(),
      locale: _defaultLocale,
      supportedLocales: [_defaultLocale],
      localizationsDelegates: _localizationsDelegates,
      initialRoute: Routes.HOME,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const MyHomePage();
        });
      },
      getPages: [
        GetPage(
            name: Routes.HOME,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 500),
            page: () => const MyHomePage()
        ),
        GetPage(
          name: Routes.RECIPE,
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
          page: () => RecipePege(),
        ),
        GetPage(
              name: Routes.INGRIDIENT,
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              page: () => const IngridientPage(),
            ),
        GetPage(
              name: Routes.CATALOG,
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 500),
              page: () => const CatalogPage(),
            ),
      ],
    );
  }
}


