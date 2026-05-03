import 'package:cookbook/core/color/app_colors.dart';
import 'package:flutter/material.dart';

/// Централизованная типографика приложения (рустик стиль)
class AppTextTheme {
  AppTextTheme._();

  /// Основной текстовый набор
  static const TextTheme lightTextTheme = TextTheme(
    /// Заголовок страниц (категории, рецепты)
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      letterSpacing: 0.2,
    ),
  /// Заголовок карточек (плитки)
  titleMedium: TextStyle(
  fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),

  /// Основной текст (описания, ингредиенты)
      bodyLarge: TextStyle(
  fontSize: 16,
  height: 1.4,
  color: AppColors.textPrimary,
  ),

  /// Вторичный текст (подписи, мета-информация)
  bodyMedium: TextStyle(
  fontSize: 14,
  height: 1.3,
  color: AppColors.textSecondary,
  ),

  /// Мелкий текст (категории, теги)
  labelSmall: TextStyle(
  fontSize: 12,
  color: AppColors.textSecondary,
  letterSpacing: 0.3,
  ),

  );
}
