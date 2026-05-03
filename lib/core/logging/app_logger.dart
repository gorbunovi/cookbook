import 'package:logger/logger.dart';

/// Централизованное логирование приложения
/// Используется вместо print() во всём проекте
class AppLogger {
  AppLogger._();

  /// Внутренний экземпляр logger
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // не показывать stacktrace методов
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
  );

  /// Информационные сообщения (жизненный цикл, загрузка данных)
  static void i(String message) {
    _logger.i(message);
  }

  /// Отладочные сообщения (UI, состояния, временные данные)
  static void d(String message) {
    _logger.d(message);
  }

  /// Ошибки (исключения, сбои API, логика)
  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Предупреждения (не критично, но важно)
  static void w(String message) {
    _logger.w(message);
  }
}
