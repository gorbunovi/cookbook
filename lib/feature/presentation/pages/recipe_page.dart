import 'package:cookbook/core/core.dart';
import 'package:cookbook/feature/presentation/pages/recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipePage extends StatelessWidget {
  RecipePage({super.key});

  final controller = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.recipe.value?.title ?? '');
        }),
      ),

      body: Obx(() {
        final recipe = controller.recipe.value;

        if (recipe == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            /// 🔢 Порции
            Padding(
              padding: const EdgeInsets.all(12),
              child: Obx(() {
                return Slider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  value: controller.servings.value,
                  onChanged: (v) => controller.servings.value = v,
                );
              }),
            ),

            /// 🔘 TAB BAR (custom)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _TabButton("Ingredients", 0),
                _TabButton("Steps", 1),
                _TabButton("Equipment", 2),
              ],
            ),

            const Divider(),

            /// 📦 CONTENT
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {

                /// 🥕 INGREDIENTS
                  case 0:
                    return ListView(
                      padding: const EdgeInsets.all(12),
                      children: recipe.ingredients.map((ing) {
                        final value = controller.scale(ing.quantity);

                        return ListTile(
                          title: Text(
                            "${value.toStringAsFixed(1)} ${ing.unit} ${ing.name}",
                          ),
                          trailing: ing.recipeId != null
                              ? IconButton(
                            icon: const Icon(Icons.open_in_new),
                            onPressed: () =>
                                controller.openRecipe(ing.recipeId!),
                          )
                              : null,
                        );
                      }).toList(),
                    );

                /// 🍳 STEPS
                  case 1:
                    return ListView(
                      padding: const EdgeInsets.all(12),
                      children: recipe.steps.asMap().entries.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text("${e.key + 1}. ${e.value}"),
                        );
                      }).toList(),
                    );

                /// 🛠 EQUIPMENT
                  case 2:
                    return ListView(
                      padding: const EdgeInsets.all(12),
                      children: recipe.equipment.map((e) {
                        return Chip(
                          label: Text(e),
                          backgroundColor: AppColors.card,
                        );
                      }).toList(),
                    );

                  default:
                    return const SizedBox();
                }
              }),
            ),
          ],
        );
      }),
    );
  }

  /// 🔘 TAB BUTTON
  Widget _TabButton(String title, int index) {
    return Obx(() {
      final isActive = controller.selectedTab.value == index;

      return GestureDetector(
        onTap: () => controller.setTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    });
  }
}