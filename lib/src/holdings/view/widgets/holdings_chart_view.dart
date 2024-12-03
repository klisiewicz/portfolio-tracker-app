import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

class HoldingsChartView extends StatelessWidget {
  const HoldingsChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _HoldingChartLegendView(),
        SizedBox(height: 16),
        Expanded(child: _HoldingsPieChartView()),
      ],
    );
  }
}

class _HoldingChartLegendView extends ConsumerWidget {
  const _HoldingChartLegendView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetTypes = ref.watch(assetTypesProvider);
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: assetTypes.map((type) {
        return _ChartLegendEntry(
          color: type.pieChartColor,
          text: type.getLabel(context.text),
        );
      }).toList(),
    );
  }
}

class _ChartLegendEntry extends StatelessWidget {
  final String text;
  final Color color;

  const _ChartLegendEntry({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: context.textTheme.bodyMedium),
      ],
    );
  }
}

class _HoldingsPieChartView extends ConsumerWidget {
  const _HoldingsPieChartView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetDistributions = ref.watch(assetDistributionProvider);
    return assetDistributions.isNotEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              final radius = constraints.biggest.shortestSide / 2;
              return PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  startDegreeOffset: -90,
                  sections: assetDistributions.map((dist) {
                    return PieChartSectionData(
                      color: dist.type.pieChartColor,
                      value: dist.value.toDouble(),
                      title: '${dist.percentage.toStringAsFixed(0)}%',
                      titlePositionPercentageOffset: .75,
                      radius: radius,
                      titleStyle: context.textTheme.titleMedium?.copyWith(
                        color: dist.type.pieChartTextColor,
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          )
        : Center(
            child: Text(
              context.text.holdingsChartEmpty,
              style: context.textTheme.bodySmall,
            ),
          );
  }
}

extension on AssetType {
  Color get pieChartColor {
    return switch (this) {
      AssetType.bonds => const Color(0xffa1d39a),
      AssetType.crypto => const Color(0xffeac16c),
      AssetType.defi => const Color(0xffe0b8f6),
      AssetType.nft => const Color(0xffffb3ac),
      AssetType.stock => const Color(0xff3b6939),
      AssetType.realEstate => const Color(0xff5c4300),
      AssetType.unknown => const Color(0xffdee3e5),
    };
  }

  Color get pieChartTextColor {
    return switch (this) {
      AssetType.bonds => const Color(0xff0a390f),
      AssetType.crypto => const Color(0xff402d00),
      AssetType.defi => const Color(0xff422356),
      AssetType.nft => const Color(0xff571e1a),
      AssetType.stock => const Color(0xffbcf0b4),
      AssetType.realEstate => const Color(0xffffdfa0),
      AssetType.unknown => const Color(0xff0e1415),
    };
  }
}
