import 'package:get/get.dart';

/// Локализация приложения (GetX i18n)
/// Поддержка RU/EN с возможностью расширения
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    /// 🇷🇺 Русский язык
    'ru_RU': {
// Общие
      'app_title': 'Кулинарная книга',

    // Навигация
    'catalog': 'Каталог',
    'recipe': 'Рецепт',

    // UI элементы плиток
    'ingredients': 'Ингредиенты',
    'steps': 'Способ приготовления',
    'equipment': 'Оборудование',

    // Состояния
    'empty': 'Пусто',
    'loading': 'Загрузка...',

    // Действия
    'open': 'Открыть',
  },

  /// 🇬🇧 Английский язык (на будущее UI / расширение)
  'en_US': {
  'app_title': 'Cookbook',

  'catalog': 'Catalog',
  'recipe': 'Recipe',

  'ingredients': 'Ingredients',
  'steps': 'Cooking method',
  'equipment': 'Equipment',

  'empty': 'Empty',
  'loading': 'Loading...',

  'open': 'Open',
  },
};
}
