import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.catalog({required CatalogEntity catalog, required int index}) = Catalog;

  const factory HomeState.empty() = Empty;

  const factory HomeState.error(Failure failure) = Error;
}