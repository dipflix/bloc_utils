import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/status_bloc_state.dart';

typedef DynamicStatedBlocStream<T> = StateStreamableSource<BlocDynamicState<T>>;

abstract class StatedCubit<T> extends Cubit<BlocDynamicState<T>> {
  StatedCubit() : super(const LoadingState()) {
    onInit();
  }

  void onInit() {}

  Future<void> onClose() async {}

  void emitLoading() {
    emit(const LoadingState());
  }

  void emitSuccess(T data) {
    emit(SuccessState(data));
  }

  void emitError(Object error) {
    emit(ErrorState(error: error));
  }

  void emitEmpty() {
    emit(const EmptyState());
  }

  @override
  Future<void> close() async {
    await onClose();
    return super.close();
  }
}
