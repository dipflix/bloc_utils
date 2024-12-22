import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/state_builder_theme.dart';
import '../state/status_bloc_state.dart';
import '../stated_cubit.dart';

class BlocStateBuilder<T> extends StatelessWidget {
  final DynamicStatedCubitStream<T>? listener;
  final Widget Function()? loadingBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(Object e)? errorBuilder;
  final Widget Function(T state) builder;
  final Duration animationDuration;

  final bool Function(BlocDynamicState<T>, BlocDynamicState<T>)? buildWhen;

  BlocStateBuilder({
    super.key,
    this.listener,
    required this.builder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.buildWhen,
  });

  BlocStateBuilder.invisible({
    super.key,
    required this.builder,
    this.listener,
    this.loadingBuilder = SizedBox.shrink,
    this.emptyBuilder = SizedBox.shrink,
    this.errorBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.buildWhen,
  });

  Widget buildWidgetState(BuildContext context, BlocDynamicState<T> state) {
    return state.when(
      loading: () =>
          loadingBuilder?.call() ??
          BlocStateBuilderThemeProvider.of(context)?.buildLoader?.call() ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      success: (state) => builder(state),
      error: (state) =>
          errorBuilder?.call(state) ??
          Text(
            'Error: ${state}',
          ),
      empty: () => emptyBuilder?.call() ?? const Text('No data available'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicStatedCubitStream<T>, BlocDynamicState<T>>(
      bloc: listener ?? context.read<DynamicStatedCubitStream<T>>(),
      buildWhen: buildWhen,
      builder: buildWidgetState,
    );
  }
}
