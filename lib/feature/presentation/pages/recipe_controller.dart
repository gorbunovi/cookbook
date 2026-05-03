import 'package:cookbook/feature/domain/entities/recipe.dart';
import 'package:cookbook/feature/domain/repositories/recipe_repository.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  final repo = Get.find<RecipeRepository>();

  final recipe = Rxn<Recipe>();

  final servings = 2.0.obs;
  final baseServings = 2.0;

  /// 🔥 активная вкладка
  final selectedTab = 0.obs;

  late String recipeId;

  @override
  void onInit() {
    super.onInit();
    print("🔥 RECIPE CONTROLLER INIT");
    final arg = Get.arguments;

    if (arg is! String) {
      throw Exception("RecipeController expected String, got $arg");
    }

    recipeId = arg;

    _load();
  }

  Future<void> _load() async {
    recipe.value = await repo.getRecipeById(recipeId);
  }

  void setTab(int index) {
    selectedTab.value = index;
  }

  double scale(double value) {
    return value * (servings.value / baseServings);
  }

  void openRecipe(String id) {
    Get.toNamed('/recipe', arguments: id);
  }
}