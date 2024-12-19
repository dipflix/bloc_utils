import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_bloc_state.freezed.dart';

@freezed
abstract class BlocDynamicState<T> with _$BlocDynamicState<T> {
  const factory BlocDynamicState.loading() = LoadingState<T>;

  const factory BlocDynamicState.success(T data) = SuccessState<T>;

  const factory BlocDynamicState.error({required Object error}) = ErrorState<T>;

  const factory BlocDynamicState.empty() = EmptyState<T>;
}
