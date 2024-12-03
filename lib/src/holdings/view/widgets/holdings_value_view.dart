import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/shared/provider/format_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

class HoldingsAssetValueView extends ConsumerWidget {
  const HoldingsAssetValueView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(assetsTotalValueProvider);
    final formattedTotal = ref.watch(currencyFormatProvider(total));
    return Text(
      formattedTotal,
      style: context.textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }
}
