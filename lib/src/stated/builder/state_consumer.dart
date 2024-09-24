import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../stated_cubit.dart';

final class BlocStateConsumerBuilder<T extends DynamicStatedCubitStream>
    extends StatelessWidget {
  final Widget Function(dynamic state) builder;

  const BlocStateConsumerBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return context.read<T>().state.whenOrNull(success: (state) {
          return builder(state.data);
        }) ??
        const SizedBox();
  }
}
