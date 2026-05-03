import 'package:equatable/equatable.dart';

/// Базовый failure (используется в Either)
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Ошибка кеша
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}