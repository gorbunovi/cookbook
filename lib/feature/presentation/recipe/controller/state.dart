import 'package:cookbook/core/error/failure.dart';
import 'package:cookbook/feature/domain/entities/catalog_entity.dart';
import 'package:cookbook/feature/domain/entities/recipe_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = Initial;

  const factory RecipeState.loading() = Loading;

  const factory RecipeState.recipe({required RecipeEntity recipe,}) = Recipe;


  const factory RecipeState.empty() = Empty;

  const factory RecipeState.error(Failure failure) = Error;
}