import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

class HoldingsAssetFilterView extends ConsumerWidget {
  const HoldingsAssetFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetTypes = ref.watch(assetTypesProvider);
    final activeAsset = ref.watch(assetTypeFilterProvider);
    return DropdownButton<AssetType>(
      value: activeAsset,
      isDense: true,
      items: assetTypes.map((type) {
        return DropdownMenuItem<AssetType>(
          value: type,
          child: Text(type.getLabel(context.text)),
        );
      }).toList(),
      hint: Text(context.text.holdingsAssetFilterHint),
      onChanged: (asset) {
        ref.read(assetTypeFilterProvider.notifier).state =
            asset == activeAsset ? null : asset;
      },
    );
  }
}
