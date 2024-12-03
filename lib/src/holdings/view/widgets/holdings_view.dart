import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_asset_filter_view.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_asset_list_view.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_chart_view.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_value_view.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

class HoldingsView extends ConsumerWidget {
  const HoldingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsProvider);
    return CustomScrollView(
      key: const PageStorageKey('holdings'),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed([
              _SectionTitle(title: context.text.holdingsChartTitle),
              const SizedBox(height: 16),
              SizedBox(
                height: context.screenHeight * 0.35,
                child: const HoldingsChartView(),
              ),
              const SizedBox(height: 16),
              const HoldingsAssetValueView(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _SectionTitle(
                      title: context.text.holdingsAssetsTitle,
                    ),
                  ),
                  const HoldingsAssetFilterView(),
                ],
              ),
            ]),
          ),
        ),
        if (assets.isNotEmpty)
          HoldingsAssetSliverListView(assets: assets)
        else
          const SliverFillRemaining(
            child: _HoldingAssetsEmptyView(),
          ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title.toUpperCase(), style: context.textTheme.titleMedium);
  }
}

class _HoldingAssetsEmptyView extends StatelessWidget {
  const _HoldingAssetsEmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.text.holdingsAssetEmpty,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
