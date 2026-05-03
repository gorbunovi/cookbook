import 'package:cookbook/core/core.dart';
import 'package:cookbook/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../domain/entities/catalog_node.dart';
import '../../domain/repositories/recipe_repository.dart';


/// Контроллер каталога
class CatalogController extends GetxController {
  final repo = Get.find<RecipeRepository>();

  final nodes = <CatalogNode>[].obs;

  /// стек навигации (вложенные каталоги)
  final stack = <List<CatalogNode>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final data = await repo.getCatalog();
    nodes.assignAll(data);
  }

  void open(CatalogNode node) {
    AppLogger.d("Open node: ${node.title}");

    /// 📁 каталог
    if (node.type == NodeType.catalog) {
      stack.add(nodes.toList());
      nodes.assignAll(node.children);
      return;
    }

    /// 📖 рецепт
    if (node.recipeId != null) {
      Get.toNamed(
        AppRoutes.recipe,
        arguments: node.recipeId, // ✔ только ID
      );
    }
  }

  void back() {
    if (stack.isNotEmpty) {
      nodes.assignAll(stack.removeLast());
    } else {
      Get.back();
    }
  }
}

/// Каталог
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CatalogController());

    return Scaffold(
      appBar: AppBar(
        title: Text('catalog'.tr),

        /// назад только если есть стек
        leading: Obx(() {
          return controller.stack.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: controller.back,
          )
              : const SizedBox();
        }),
      ),

      body: Obx(() {
        final items = controller.nodes;

        if (items.isEmpty) {
          return Center(
            child: Text('empty'.tr),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final node = items[index];

            return _Tile(
              node: node,
              onTap: () => controller.open(node),
            );
          },
        );
      }),
    );
  }
}

/// UI плитка
class _Tile extends StatelessWidget {
  final CatalogNode node;
  final VoidCallback onTap;

  const _Tile({
    required this.node,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCatalog = node.type == NodeType.catalog;

    return GestureDetector(
      onTap:(){
        print("NAV CLICK");

        Get.toNamed(AppRoutes.recipe, arguments: "sauce_1");
      },
      // onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isCatalog ? Icons.folder : Icons.restaurant_menu,
                color: AppColors.primary,
                size: 40,
              ),
              const SizedBox(height: 10),
              Text(
                node.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}