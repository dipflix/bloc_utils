import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/status_bloc_state.dart';

typedef DynamicStatedCubitStream<T> = StateStreamableSource<DynamicState<T>>;

abstract class StatedCubit<T> extends Cubit<DynamicState<T>> {
  StatedCubit() : super(const LoadingState()) {
    onInit();
  }

  void onInit() {}

  Future<void> onClose() async {}

  @override
  Future<void> close() async {
    await onClose();
    return super.close();
  }
}
