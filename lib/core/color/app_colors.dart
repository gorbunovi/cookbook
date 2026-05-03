import 'package:flutter/material.dart';

/// Централизованные цвета приложения (рустик тема)
/// Используются во всём UI вместо "магических" Color(...)
class AppColors {
  AppColors._(); // запрет на создание экземпляра

  /// Основной фон (тёплая бумага / parchment)
  static const Color background = Color(0xFFF5F1E8);

  /// Основной текст (тёмно-коричневый)
  static const Color textPrimary = Color(0xFF2F2A25);

  /// Вторичный текст (приглушённый серо-коричневый)
  static const Color textSecondary = Color(0xFF6B6761);

  /// Основной акцент (оливково-зелёный рустик)
  static const Color primary = Color(0xFF6B7B5E);

  /// Второй акцент (дерево / тёплый коричневый)
  static const Color accent = Color(0xFF8B6F47);

  /// Светлый разделитель / линии
  static const Color divider = Color(0xFFE3D9C9);

  /// Карточки (чуть светлее фона)
  static const Color card = Color(0xFFF9F6EE);

  /// Ошибки / предупреждения (приглушённый красный)
  static const Color error = Color(0xFFB04A3A);

  /// Иконки
  static const Color icon = Color(0xFF3E3A36);
}
