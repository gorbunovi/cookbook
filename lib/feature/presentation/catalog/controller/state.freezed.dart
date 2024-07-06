// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatalogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogStateCopyWith<$Res> {
  factory $CatalogStateCopyWith(
          CatalogState value, $Res Function(CatalogState) then) =
      _$CatalogStateCopyWithImpl<$Res, CatalogState>;
}

/// @nodoc
class _$CatalogStateCopyWithImpl<$Res, $Val extends CatalogState>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'CatalogState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CatalogState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'CatalogState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CatalogState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$CatalogCopyWith<$Res> {
  factory _$$CatalogCopyWith(_$Catalog value, $Res Function(_$Catalog) then) =
      __$$CatalogCopyWithImpl<$Res>;
  @useResult
  $Res call({CatalogEntity catalog, int index});
}

/// @nodoc
class __$$CatalogCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Catalog>
    implements _$$CatalogCopyWith<$Res> {
  __$$CatalogCopyWithImpl(_$Catalog _value, $Res Function(_$Catalog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalog = null,
    Object? index = null,
  }) {
    return _then(_$Catalog(
      catalog: null == catalog
          ? _value.catalog
          : catalog // ignore: cast_nullable_to_non_nullable
              as CatalogEntity,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Catalog implements Catalog {
  const _$Catalog({required this.catalog, required this.index});

  @override
  final CatalogEntity catalog;
  @override
  final int index;

  @override
  String toString() {
    return 'CatalogState.catalog(catalog: $catalog, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Catalog &&
            (identical(other.catalog, catalog) || other.catalog == catalog) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, catalog, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogCopyWith<_$Catalog> get copyWith =>
      __$$CatalogCopyWithImpl<_$Catalog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return catalog(this.catalog, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return catalog?.call(this.catalog, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (catalog != null) {
      return catalog(this.catalog, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return catalog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return catalog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (catalog != null) {
      return catalog(this);
    }
    return orElse();
  }
}

abstract class Catalog implements CatalogState {
  const factory Catalog(
      {required final CatalogEntity catalog,
      required final int index}) = _$Catalog;

  CatalogEntity get catalog;
  int get index;
  @JsonKey(ignore: true)
  _$$CatalogCopyWith<_$Catalog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchCopyWith<$Res> {
  factory _$$SearchCopyWith(_$Search value, $Res Function(_$Search) then) =
      __$$SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({CatalogEntity catalog, int index, String searchData});
}

/// @nodoc
class __$$SearchCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Search>
    implements _$$SearchCopyWith<$Res> {
  __$$SearchCopyWithImpl(_$Search _value, $Res Function(_$Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalog = null,
    Object? index = null,
    Object? searchData = null,
  }) {
    return _then(_$Search(
      catalog: null == catalog
          ? _value.catalog
          : catalog // ignore: cast_nullable_to_non_nullable
              as CatalogEntity,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      searchData: null == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Search implements Search {
  const _$Search(
      {required this.catalog, required this.index, required this.searchData});

  @override
  final CatalogEntity catalog;
  @override
  final int index;
  @override
  final String searchData;

  @override
  String toString() {
    return 'CatalogState.search(catalog: $catalog, index: $index, searchData: $searchData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Search &&
            (identical(other.catalog, catalog) || other.catalog == catalog) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.searchData, searchData) ||
                other.searchData == searchData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, catalog, index, searchData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCopyWith<_$Search> get copyWith =>
      __$$SearchCopyWithImpl<_$Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return search(this.catalog, index, searchData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return search?.call(this.catalog, index, searchData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this.catalog, index, searchData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements CatalogState {
  const factory Search(
      {required final CatalogEntity catalog,
      required final int index,
      required final String searchData}) = _$Search;

  CatalogEntity get catalog;
  int get index;
  String get searchData;
  @JsonKey(ignore: true)
  _$$SearchCopyWith<_$Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCopyWith<$Res> {
  factory _$$EmptyCopyWith(_$Empty value, $Res Function(_$Empty) then) =
      __$$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Empty>
    implements _$$EmptyCopyWith<$Res> {
  __$$EmptyCopyWithImpl(_$Empty _value, $Res Function(_$Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'CatalogState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements CatalogState {
  const factory Empty() = _$Empty;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$Error(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'CatalogState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CatalogEntity catalog, int index) catalog,
    required TResult Function(
            CatalogEntity catalog, int index, String searchData)
        search,
    required TResult Function() empty,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CatalogEntity catalog, int index)? catalog,
    TResult? Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult? Function()? empty,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CatalogEntity catalog, int index)? catalog,
    TResult Function(CatalogEntity catalog, int index, String searchData)?
        search,
    TResult Function()? empty,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Catalog value) catalog,
    required TResult Function(Search value) search,
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Catalog value)? catalog,
    TResult? Function(Search value)? search,
    TResult? Function(Empty value)? empty,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Catalog value)? catalog,
    TResult Function(Search value)? search,
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CatalogState {
  const factory Error(final Failure failure) = _$Error;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
