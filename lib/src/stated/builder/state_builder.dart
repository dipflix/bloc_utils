import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/state_builder_theme.dart';
import '../state/status_bloc_state.dart';
import '../stated_cubit.dart';

part 'state_success_or_else_builder.dart';

base class BlocDynamicStateBuilder<S>
    extends BlocBuilderBase<DynamicStatedBlocStream<S>, BlocDynamicState<S>> {
  final DynamicStatedBlocStream<S> bloc;
  final Widget Function()? loadingBuilder;
  final Widget Function()? emptyBuilder;
  final Widget Function(Object e)? errorBuilder;
  final Widget Function(BuildContext context, S state) builder;

  final bool Function(BlocDynamicState<S>, BlocDynamicState<S>)? buildWhen;

  BlocDynamicStateBuilder({
    super.key,
    required this.bloc,
    this.buildWhen,
    required this.builder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
  }) : super(
          bloc: bloc,
          buildWhen: buildWhen,
        );

  factory BlocDynamicStateBuilder.successOrElse({
    required DynamicStatedBlocStream<S> bloc,
    final bool Function(BlocDynamicState<S>, BlocDynamicState<S>)? buildWhen,
    Widget Function(BuildContext context, S state)? builder,
    required Widget Function(BuildContext context) orElse,
  }) {
    return _BlocDynamicSuccessOrElseStateBuilder<S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: builder,
      orElse: orElse,
    );
  }

  factory BlocDynamicStateBuilder.onlySuccess({
    required DynamicStatedBlocStream<S> bloc,
    final bool Function(BlocDynamicState<S>, BlocDynamicState<S>)? buildWhen,
    Widget Function(BuildContext context, S state)? builder,
    Widget Function(BuildContext context)? orElse,
  }) {
    return _BlocDynamicSuccessOrElseStateBuilder<S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: builder,
      orElse: orElse ?? (_) => const SizedBox.shrink(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<BlocWidgetBuilder<S>>.has('builder', builder),
    );
  }

  Widget buildLoading(BuildContext context) {
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
  }

  Widget buildSuccess(BuildContext context, S state) {
    return builder(context, state);
  }

  Widget buildError(BuildContext context, Object state) {
    if (errorBuilder != null) {
      return errorBuilder!(state);
    }

    return Text(
      'Error: ${state}',
    );
  }

  Widget buildEmpty(BuildContext context) {
    if (emptyBuilder != null) {
      return emptyBuilder!();
    }
    return const Text('No data available');
  }

  @override
  Widget build(BuildContext context, BlocDynamicState<S> state) {
    return state.when(
      loading: () => buildLoading(context),
      success: (state) => buildSuccess(context, state),
      error: (state) => buildError(context, state),
      empty: () => buildEmpty(context),
    );
  }
}
