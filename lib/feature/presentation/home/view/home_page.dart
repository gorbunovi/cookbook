import 'package:cookbook/feature/presentation/home/widgets/catalog_widget.dart';
import 'package:cookbook/feature/presentation/home/widgets/index_home_widget.dart';
import 'package:cookbook/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookbook/core/core.dart' as core_widgets;

import '../controller/index.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              catalog:(catalog, index)=> CatalogWidget(
                searchData: '',
                catalog: catalog,
                selectedIndex: index,
                reset: () => BlocProvider.of<HomeController>(context).reset(),
                isFilter: false,
                tapBottomNavigationBar: (index) => BlocProvider.of<HomeController>(context).tapBottomNavigationBar(index),
                tapFilter: ()=> BlocProvider.of<HomeController>(context).init(),
                tapCatalog: (catalog,)=> BlocProvider.of<HomeController>(context).
                tapCatalog(catalog: catalog,),
                tapRecipe: (recipe)=> BlocProvider.of<HomeController>(context).
                tapRecipe(recipe: recipe),
                toCatalog: ()=> BlocProvider.of<HomeController>(context).init(),
                toHome: ()=> BlocProvider.of<HomeController>(context).toHome(),
                toBack: ()=> BlocProvider.of<HomeController>(context).toBack(),
                search: (search)=> BlocProvider.of<HomeController>(context).search(search),
              ),
              search: (catalog, index, searchData) => CatalogWidget(
                searchData: searchData,
                catalog: catalog,
                selectedIndex: index,
                reset: () => BlocProvider.of<HomeController>(context).reset(),
                isFilter: false,
                tapBottomNavigationBar: (index) => BlocProvider.of<HomeController>(context).tapBottomNavigationBar(index),
                tapFilter: ()=> BlocProvider.of<HomeController>(context).init(),
                tapCatalog: (catalog,)=> BlocProvider.of<HomeController>(context).
                tapCatalog(catalog: catalog,),
                tapRecipe: (recipe)=> BlocProvider.of<HomeController>(context).
                tapRecipe(recipe: recipe),
                toCatalog: ()=> BlocProvider.of<HomeController>(context).init(),
                toHome: ()=> BlocProvider.of<HomeController>(context).toHome(),
                toBack: ()=> BlocProvider.of<HomeController>(context).toBack(),
                search: (search)=> BlocProvider.of<HomeController>(context).search(search),
              ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeController>(
      create: (context) => sl<HomeController>()..init(),
      child: _buildBody(context),
    );
  }
}

