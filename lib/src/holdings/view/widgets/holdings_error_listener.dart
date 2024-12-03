import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings_exception.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';
import 'package:portfolio_tracker_app/src/shared/view/notification.dart';

class HoldingsErrorListener extends ConsumerWidget {
  final Widget child;

  const HoldingsErrorListener({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      holdingsProvider,
      (
        AsyncValue<Holdings>? previous,
        AsyncValue<Holdings?> next,
      ) async {
        if (!context.mounted) return;
        if (previous == null) return;
        next.maybeWhen(
          error: (error, _) {
            context.showErrorNotification(
              message: switch (error) {
                HoldingsNotFoundException(userId: final userId) =>
                  context.text.holdingsErrorNotFound(userId),
                _ => context.text.holdingsErrorUnknown,
              },
            );
          },
          orElse: () {},
        );
      },
    );
    return child;
  }
}
