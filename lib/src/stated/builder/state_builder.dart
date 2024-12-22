import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/state_builder_theme.dart';
import '../state/status_bloc_state.dart';
import '../stated_cubit.dart';

class BlocStateBuilder<T> extends StatelessWidget {
  final DynamicStatedCubitStream<T> listener;
  final Widget Function()? loadingBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(Object e)? errorBuilder;
  final Widget Function(T state) builder;
  final Duration animationDuration;

  final bool Function(BlocDynamicState<T>, BlocDynamicState<T>)? buildWhen;

  BlocStateBuilder({
    super.key,
    required this.listener,
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
    required this.listener,
    this.loadingBuilder = SizedBox.shrink,
    this.emptyBuilder = SizedBox.shrink,
    this.errorBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
    this.buildWhen,
  });

  Widget buildWidgetState(BuildContext context, BlocDynamicState<T> state) {
    return state.when(
      loading: () {
        final defaultBuilder =
            BlocStateBuilderThemeProvider.of(context)?.buildLoader;

        if (loadingBuilder != null) {
          return loadingBuilder!();
        } else if (defaultBuilder != null) {
          return defaultBuilder();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      success: builder,
      error: (state) {
        if (errorBuilder != null) {
          return errorBuilder!(state);
        }

        return Text(
          'Error: ${state}',
        );
      },
      empty: () {
        if(emptyBuilder != null){
          return emptyBuilder!();
        }
        return const Text('No data available');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicStatedCubitStream<T>, BlocDynamicState<T>>(
      bloc: listener,
      buildWhen: buildWhen,
      builder: buildWidgetState,
    );
  }
}
