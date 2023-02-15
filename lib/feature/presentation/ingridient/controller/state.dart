import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class IngridientState with _$IngridientState {
  const factory IngridientState.initial() = Initial;

  const factory IngridientState.loading() = Loading;

  const factory IngridientState.catalog({required CatalogEntity catalog, required int index}) = Catalog;


  const factory IngridientState.empty() = Empty;

  const factory IngridientState.error(Failure failure) = Error;
}