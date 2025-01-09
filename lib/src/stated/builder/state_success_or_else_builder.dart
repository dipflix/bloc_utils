part of 'state_builder.dart';

final class _BlocDynamicSuccessOrElseStateBuilder<S>
    extends BlocDynamicStateBuilder<S> {
  final Widget Function(BuildContext context) orElse;

  _BlocDynamicSuccessOrElseStateBuilder({
    required super.bloc,
    super.buildWhen,
    Widget Function(BuildContext context, S state)? builder,
    required this.orElse,
  }) : super(
          builder: builder ?? (context, __) => orElse(context),
        );

  @override
  Widget build(BuildContext context, BlocDynamicState<S> state) {
    return state.maybeWhen(
      success: (state) => buildSuccess(context, state),
      orElse: () => orElse(context),
    );
  }
}
