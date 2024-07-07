
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:cookbook/feature/presentation/recipe/widgets/recipe_widget.dart';
import 'package:cookbook/servise_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookbook/core/core.dart' as core_widgets;
import 'package:get/get.dart';

import '../controller/index.dart';
import '../widgets/index_recipe_widget.dart';

class RecipePege extends StatelessWidget {
  RecipePege({Key? key}) : super(key: key);

  RecipeEntity recipe = Get.arguments;


  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RecipeController, RecipeState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              recipe:(recipe, isWakelock)=> RecipeWidget(
                recipe: recipe,
                isWakelock: isWakelock,
                wakelockClik: (recipe)=> BlocProvider.of<RecipeController>(context).wakelockClik(recipe: recipe),
                tapRecalculationNetto: (recalculationNetto, recipe)=> BlocProvider.of<RecipeController>(context).
                tapRecalculationNetto(recalculationNetto: recalculationNetto, recipe: recipe) ,
                tapRecalculation: (original, recalculation, recipe)=> BlocProvider.of<RecipeController>(context).
                tapRecalculation(original: original, recalculation: recalculation, recipe: recipe),
                tapBottomNavigationBar: (index) => BlocProvider.of<RecipeController>(context).tapBottomNavigationBar(index),
                tapCatalog: (catalog)=> BlocProvider.of<RecipeController>(context).tapCatalog(catalog),
                toCatalog: ()=> BlocProvider.of<RecipeController>(context).toHome(),
                toBack: ()=> BlocProvider.of<RecipeController>(context).toBack(),
                toHome: ()=> BlocProvider.of<RecipeController>(context).toHome(),
              ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeController>(
      create: (context) => sl<RecipeController>()..init(recipe),
      child: _buildBody(context),
    );
  }
}

