import 'package:equatable/equatable.dart';

sealed class ProcessStatus extends Equatable {
  const ProcessStatus();

  void when({
    void Function()? handling,
    void Function()? success,
    void Function(String massage)? failure,
    void Function()? canceled,
  }) {
    if (handling != null && this is ProcessHandleStatus) {
      handling.call();
    } else if (success != null && this is ProcessSuccessStatus) {
      success.call();
    } else if (failure != null && this is ProcessFailureStatus) {
      failure.call((this as ProcessFailureStatus).message ?? "");
    } else if (canceled != null && this is ProcessCanceledStatus) {
      canceled.call();
    }
  }

  @override
  List<Object?> get props => [runtimeType];
}

final class ProcessInitialStatus extends ProcessStatus {
  const ProcessInitialStatus();
}

final class ProcessHandleStatus extends ProcessStatus {
  const ProcessHandleStatus();
}

final class ProcessSuccessStatus extends ProcessStatus {
  const ProcessSuccessStatus();
}

final class ProcessFailureStatus extends ProcessStatus {
  final String? message;

  const ProcessFailureStatus({
    this.message,
  });

  @override
  List<Object?> get props => [...super.props, message];
}

final class ProcessCanceledStatus extends ProcessStatus {
  const ProcessCanceledStatus();
}
