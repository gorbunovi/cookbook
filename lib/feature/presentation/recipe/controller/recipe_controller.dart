import 'package:cookbook/core/usecase/usecase.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:cookbook/feature/domain/usecases/get_catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'index.dart';

class RecipeController extends Cubit<RecipeState> {
  RecipeController({required this.getCatalogs}) : super(const Initial());
  final GetCatalogs getCatalogs;
  CatalogEntity catalog =
      CatalogEntity(id: 0, name: 'Кулинарная книга', photo: '', info: '');
  int _index = 0;
  bool isWakelock = false;

  Future<void> init(RecipeEntity recipe) async {
    final currentState = state;
    emit(const Loading());
    if (currentState is Loading) return;
    print(' Recipe -- $recipe');
    emit(Recipe(recipe: recipe, isWakelock: isWakelock));
  }

  void tapBottomNavigationBar(int index) {
    _index = index;
    emit(const Loading());
    // emit(Catalog(catalog: catalog, index: index));
  }

  void toHome() {
    emit(const Loading());
    // emit(Catalog(catalog: catalog, index: _index));
  }

  void tapCatalog(CatalogEntity catalog) {
    print('${catalog.name}-- ${catalog.toString()}');
    emit(const Loading());
    // emit(Catalog(catalog: catalog, index: _index));
  }

  void tapRecalculation({
    required double original,
    double? recalculation,
    required RecipeEntity recipe,
  }) {
    if (recalculation == null) {
      recipe.ingridients?.forEach((ingridient) {
        ingridient.weightExisting = null;
        emit(Loading());
        emit(Recipe(recipe: recipe, isWakelock: isWakelock));
      });
    } else {
      print('original -- $original,  recalculation -- $recalculation');
      double coefficient = recalculation / original;
      recipe.weightNetto = 1000 * coefficient;
      recipe.ingridients?.forEach((ingridient) {
        ingridient.weightExisting =
            (ingridient.weight! * coefficient).toPrecision(2);
      });
      emit(Loading());
      emit(Recipe(recipe: recipe, isWakelock: isWakelock));
    }
  }

  void tapRecalculationNetto({required double? recalculationNetto, required RecipeEntity recipe,}){
    print('recalculationNetto -- $recalculationNetto');
    if (recalculationNetto == null) {
      recipe.weightNetto = 0.0;
      recipe.ingridients?.forEach((ingridient) {
        ingridient.weightExisting = null;
        emit(Loading());
        emit(Recipe(recipe: recipe, isWakelock: isWakelock));
      });
    } else {
      double coefficient = recalculationNetto / 1000;
      recipe.weightNetto = recalculationNetto;
      recipe.ingridients?.forEach((ingridient) {
        ingridient.weightExisting =
            (ingridient.weight! * coefficient).toPrecision(2);
        print('${ingridient.name} -- ${ingridient.weightExisting}');
      });
    }
    emit(Loading());
    emit(Recipe(recipe: recipe, isWakelock: isWakelock));
  }

  void wakelockClik({required RecipeEntity recipe,}){
    isWakelock = !isWakelock;
    emit(Recipe(recipe: recipe, isWakelock: isWakelock));
  }

  void toBack() {
    Get.back();
  }
}
