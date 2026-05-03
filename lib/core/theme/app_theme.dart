import 'package:cookbook/core/color/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

/// Главная тема приложения (рустик стиль)
class AppTheme {
  AppTheme._();

  /// Светлая тема (основная)
  static ThemeData light = ThemeData(
    /// Базовая яркость
    brightness: Brightness.light,

    /// Цвет фона всего приложения
    scaffoldBackgroundColor: AppColors.background,

    /// Цветовая схема Material 3 (упрощённая, без перегруза)
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.card,
      error: AppColors.error,
    ),

    /// Типографика (централизованная)
    textTheme: AppTextTheme.lightTextTheme,

    /// AppBar стиль (рустик минимализм)
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.icon),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    ),

    /// Карточки (основа плиток каталога)
    cardTheme: const CardThemeData(
      color: AppColors.card,
      elevation: 0,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    ),

    /// Иконки
    iconTheme: const IconThemeData(color: AppColors.icon),

    /// Разделители
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),

    /// Splash / ripple эффекты (мягкие, без агрессии)
    splashColor: AppColors.primary.withOpacity(0.08),
    highlightColor: Colors.transparent,
  );
}
