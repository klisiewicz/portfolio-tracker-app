import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:portfolio_tracker_app/src/shared/provider/format_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

class HoldingsAssetSliverListView extends SliverList {
  HoldingsAssetSliverListView({
    required List<Asset> assets,
    super.key,
  }) : super(
          delegate: SliverChildBuilderDelegate(
            childCount: assets.length,
            (context, index) {
              return _AssetListItem(asset: assets[index]);
            },
          ),
        );
}

class _AssetListItem extends ConsumerWidget {
  final Asset asset;

  const _AssetListItem({
    required this.asset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedValue = ref.watch(currencyFormatProvider(asset.value));
    return ListTile(
      title: Text('${asset.name} (${asset.ticker})'),
      subtitle: Text(asset.type.getLabel(context.text)),
      trailing: Text(formattedValue),
    );
  }
}
