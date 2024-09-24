import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

sealed class DynamicState<T> extends Equatable {
  const DynamicState();

  R? whenOrNull<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return null;
  }

  R when<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    throw UnimplementedError();
  }

  R maybeWhen<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
    required R Function() orElse,
  }) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [];
}

final class LoadingState<T> extends DynamicState<T> {
  const LoadingState();

  @override
  @optionalTypeArgs
  R? whenOrNull<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
    required R Function() orElse,
  }) {
    if (loading != null) {
      return loading();
    }

    return orElse();
  }

  @override
  @optionalTypeArgs
  R when<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return loading!();
  }
}

final class SuccessState<T> extends DynamicState<T> {
  final T data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];

  SuccessState<T> copyWith({
    T? data,
  }) {
    return SuccessState(
      data ?? this.data,
    );
  }

  @override
  @optionalTypeArgs
  R? whenOrNull<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  R when<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return success!(this);
  }

  @override
  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
    required R Function() orElse,
  }) {
    if (success != null) {
      return success(this);
    }

    return orElse();
  }
}

final class ErrorState<T> extends DynamicState<T> {
  final dynamic error;

  const ErrorState(this.error);

  @override
  List<Object?> get props => [error];

  @override
  @optionalTypeArgs
  R? whenOrNull<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  R when<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return error!(this);
  }

  @override
  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
    required R Function() orElse,
  }) {
    if (error != null) {
      return error(this);
    }

    return orElse();
  }
}

final class EmptyState<T> extends DynamicState<T> {
  const EmptyState();

  @override
  @optionalTypeArgs
  R? whenOrNull<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  R when<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
  }) {
    return empty!();
  }

  @override
  @optionalTypeArgs
  R maybeWhen<R>({
    R Function()? loading,
    R Function(SuccessState<T> state)? success,
    R Function(ErrorState<T> error)? error,
    R Function()? empty,
    required R Function() orElse,
  }) {
    if (empty != null) {
      return empty();
    }

    return orElse();
  }
}
