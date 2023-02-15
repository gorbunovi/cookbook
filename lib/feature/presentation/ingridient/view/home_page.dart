
import 'package:cookbook/core/core.dart' as core_widgets;
import 'package:cookbook/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';
import '../widgets/catalog_widget.dart';
import '../widgets/index_home_widget.dart';

class IngridientPage extends StatelessWidget {
  const IngridientPage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<IngridientController, IngridientState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              catalog:(catalog, index)=> CatalogWidget(
                catalog: catalog,
                selectedIndex: index,
                isFilter: false,
                tapBottomNavigationBar: (index) => BlocProvider.of<IngridientController>(context).tapBottomNavigationBar(index),
                tapFilter: ()=> BlocProvider.of<IngridientController>(context).init(),
                tapCatalog: (catalog)=> BlocProvider.of<IngridientController>(context).tapCatalog(catalog),
                toCatalog: ()=> BlocProvider.of<IngridientController>(context).init(),
                toHome: ()=> BlocProvider.of<IngridientController>(context).toHome(),
              ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IngridientController>(
      create: (context) => sl<IngridientController>()..init(),
      child: _buildBody(context),
    );
  }
}

