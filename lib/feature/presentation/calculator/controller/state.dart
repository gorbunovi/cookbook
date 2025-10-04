import 'package:cookbook/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState.initial() = Initial;

  const factory CalculatorState.loading() = Loading;

  const factory CalculatorState.catalog() = Catalog;

  const factory CalculatorState.calculator() = Calculator;


  const factory CalculatorState.empty() = Empty;

  const factory CalculatorState.error(Failure failure) = Error;
}