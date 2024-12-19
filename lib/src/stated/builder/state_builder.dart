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
  final Widget Function(Widget child, Animation<double> animation)?
      transitionBuilder;

  final bool Function(BlocDynamicState<T>, BlocDynamicState<T>)? buildWhen;

  const BlocStateBuilder({
    super.key,
    this.listener,
    required this.builder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.transitionBuilder,
    this.buildWhen,
  });

  factory BlocStateBuilder.invisible({
     DynamicStatedCubitStream<T>? listener,
    required Widget Function(T state) builder,
    Widget Function()? loadingBuilder,
    Widget Function()? emptyBuilder,
    Widget Function(Object e)? errorBuilder,
    Duration animationDuration = const Duration(milliseconds: 300),
    Widget Function(Widget child, Animation<double> animation)?
        transitionBuilder,
    bool Function(BlocDynamicState<T>, BlocDynamicState<T>)? buildWhen,
  }) {
    return BlocStateBuilder(
      listener: listener,
      builder: builder,
      buildWhen: buildWhen,
      loadingBuilder: loadingBuilder ?? () => const SizedBox.shrink(),
      emptyBuilder: emptyBuilder ?? () => const SizedBox.shrink(),
      errorBuilder: errorBuilder ?? (_) => const SizedBox.shrink(),
      animationDuration: animationDuration,
      transitionBuilder: transitionBuilder ?? (child, animation) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicStatedCubitStream<T>, BlocDynamicState<T>>(
      bloc: listener ?? context.read<DynamicStatedCubitStream<T>>(),
      buildWhen: buildWhen,
      builder: (BuildContext context, state) {
        Widget content = state.whenOrNull(
              loading: () =>
                  loadingBuilder?.call() ??
                  BlocStateBuilderThemeProvider.of(context)
                      ?.buildLoader
                      ?.call() ??
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              success: (state) => builder(state),
              error: (state) =>
                  errorBuilder?.call(state) ??
                  Text(
                    'Error: ${state}',
                  ),
              empty: () =>
                  emptyBuilder?.call() ?? const Text('No data available'),
            ) ??
            const SizedBox();

        return AnimatedSwitcher(
          duration: animationDuration,
          transitionBuilder: transitionBuilder ?? defaultTransitionBuilder,
          child: content,
        );
      },
    );
  }

  static Widget defaultTransitionBuilder(
    Widget child,
    Animation<double> animation,
  ) {
    const offset = Offset(0.0, 0.02);
    final slideTransition = SlideTransition(
      position: Tween<Offset>(
        begin: offset,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
    return FadeTransition(
      opacity: animation,
      child: slideTransition,
    );
  }
}
