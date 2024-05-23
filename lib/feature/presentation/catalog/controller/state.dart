import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = Initial;

  const factory CatalogState.loading() = Loading;

  const factory CatalogState.catalog({required CatalogEntity catalog, required int index}) = Catalog;


  const factory CatalogState.empty() = Empty;

  const factory CatalogState.error(Failure failure) = Error;
}