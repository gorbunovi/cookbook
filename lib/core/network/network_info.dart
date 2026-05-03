
import 'package:cookbook/core/logging/app_logger.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// 🌐 Проверка интернета
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  final InternetConnectionChecker checker;

  NetworkInfoImpl(this.checker);

  @override
  Future<bool> get isConnected async {
    final result = await checker.hasConnection;

    AppLogger.i('🌐 INTERNET: $result');

    return result;
  }
}