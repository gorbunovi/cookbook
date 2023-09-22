
import 'package:cookbook/feature/presentation/home/widgets/index_home_widget.dart';
import 'package:cookbook/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookbook/core/core.dart' as core_widgets;

import '../controller/index.dart';
import '../widgets/catalog_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CatalogController, CatalogState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              catalog:(catalog, index)=> CatalogWidget(
                catalog: catalog,
                selectedIndex: index,
                isFilter: false,
                tapBottomNavigationBar: (index) => BlocProvider.of<CatalogController>(context).tapBottomNavigationBar(index),
                tapFilter: ()=> BlocProvider.of<CatalogController>(context).init(),
                tapCatalog: (catalog)=> BlocProvider.of<CatalogController>(context).tapCatalog(catalog: catalog),
                toCatalog: ()=> BlocProvider.of<CatalogController>(context).init(),
                toHome: ()=> BlocProvider.of<CatalogController>(context).toHome(),
                toBack: ()=> BlocProvider.of<CatalogController>(context).toBack(),
                search: (search)=> BlocProvider.of<CatalogController>(context).search(search),
                tapRecipe: (recipe)=> BlocProvider.of<CatalogController>(context).
                tapRecipe(recipe: recipe),
              ),
            search: (catalog, index, searchData) => CatalogWidget(
                searchData: searchData,
                catalog: catalog,
                selectedIndex: index,
                isFilter: false,
                tapBottomNavigationBar: (index) => BlocProvider.of<CatalogController>(context).tapBottomNavigationBar(index),
                tapFilter: ()=> BlocProvider.of<CatalogController>(context).init(),
                tapCatalog: (catalog)=> BlocProvider.of<CatalogController>(context).tapCatalog(catalog: catalog),
                toCatalog: ()=> BlocProvider.of<CatalogController>(context).init(),
                toHome: ()=> BlocProvider.of<CatalogController>(context).toHome(),
                toBack: ()=> BlocProvider.of<CatalogController>(context).toBack(),
                search: (search)=> BlocProvider.of<CatalogController>(context).search(search),
                tapRecipe: (recipe)=> BlocProvider.of<CatalogController>(context).
                tapRecipe(recipe: recipe),
            ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogController>(
      create: (context) => sl<CatalogController>()..init(),
      child: _buildBody(context),
    );
  }
}

