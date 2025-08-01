// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlocDynamicState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BlocDynamicState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BlocDynamicState<$T>()';
  }
}

/// @nodoc
class $BlocDynamicStateCopyWith<T, $Res> {
  $BlocDynamicStateCopyWith(
      BlocDynamicState<T> _, $Res Function(BlocDynamicState<T>) __);
}

/// Adds pattern-matching-related methods to [BlocDynamicState].
extension BlocDynamicStatePatterns<T> on BlocDynamicState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(SuccessState<T> value)? success,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(EmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState() when loading != null:
        return loading(_that);
      case SuccessState() when success != null:
        return success(_that);
      case ErrorState() when error != null:
        return error(_that);
      case EmptyState() when empty != null:
        return empty(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(SuccessState<T> value) success,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(EmptyState<T> value) empty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState():
        return loading(_that);
      case SuccessState():
        return success(_that);
      case ErrorState():
        return error(_that);
      case EmptyState():
        return empty(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(SuccessState<T> value)? success,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(EmptyState<T> value)? empty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState() when loading != null:
        return loading(_that);
      case SuccessState() when success != null:
        return success(_that);
      case ErrorState() when error != null:
        return error(_that);
      case EmptyState() when empty != null:
        return empty(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Object error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState() when loading != null:
        return loading();
      case SuccessState() when success != null:
        return success(_that.data);
      case ErrorState() when error != null:
        return error(_that.error);
      case EmptyState() when empty != null:
        return empty();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Object error) error,
    required TResult Function() empty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState():
        return loading();
      case SuccessState():
        return success(_that.data);
      case ErrorState():
        return error(_that.error);
      case EmptyState():
        return empty();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(Object error)? error,
    TResult? Function()? empty,
  }) {
    final _that = this;
    switch (_that) {
      case LoadingState() when loading != null:
        return loading();
      case SuccessState() when success != null:
        return success(_that.data);
      case ErrorState() when error != null:
        return error(_that.error);
      case EmptyState() when empty != null:
        return empty();
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoadingState<T> implements BlocDynamicState<T> {
  const LoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BlocDynamicState<$T>.loading()';
  }
}

/// @nodoc

class SuccessState<T> implements BlocDynamicState<T> {
  const SuccessState(this.data);

  final T data;

  /// Create a copy of BlocDynamicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessStateCopyWith<T, SuccessState<T>> get copyWith =>
      _$SuccessStateCopyWithImpl<T, SuccessState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'BlocDynamicState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<T, $Res>
    implements $BlocDynamicStateCopyWith<T, $Res> {
  factory $SuccessStateCopyWith(
          SuccessState<T> value, $Res Function(SuccessState<T>) _then) =
      _$SuccessStateCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$SuccessStateCopyWithImpl<T, $Res>
    implements $SuccessStateCopyWith<T, $Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState<T> _self;
  final $Res Function(SuccessState<T>) _then;

  /// Create a copy of BlocDynamicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(SuccessState<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ErrorState<T> implements BlocDynamicState<T> {
  const ErrorState({required this.error});

  final Object error;

  /// Create a copy of BlocDynamicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorStateCopyWith<T, ErrorState<T>> get copyWith =>
      _$ErrorStateCopyWithImpl<T, ErrorState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorState<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'BlocDynamicState<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<T, $Res>
    implements $BlocDynamicStateCopyWith<T, $Res> {
  factory $ErrorStateCopyWith(
          ErrorState<T> value, $Res Function(ErrorState<T>) _then) =
      _$ErrorStateCopyWithImpl;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<T, $Res>
    implements $ErrorStateCopyWith<T, $Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState<T> _self;
  final $Res Function(ErrorState<T>) _then;

  /// Create a copy of BlocDynamicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ErrorState<T>(
      error: null == error ? _self.error : error,
    ));
  }
}

/// @nodoc

class EmptyState<T> implements BlocDynamicState<T> {
  const EmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BlocDynamicState<$T>.empty()';
  }
}

// dart format on
