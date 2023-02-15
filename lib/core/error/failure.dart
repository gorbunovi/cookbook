import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  const Failure(this.message);
  final String message;
  @override
  String toString() {
    return message;
  }
}
  class CacheFailure extends Failure {
  CacheFailure(super.message);

  @override
  List<Object?> get props => [];
}

