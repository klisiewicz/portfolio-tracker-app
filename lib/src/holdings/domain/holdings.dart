import 'dart:collection';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:rational/rational.dart';

part 'holdings.g.dart';

@JsonSerializable(
  createToJson: false,
)
@immutable
final class Holdings with EquatableMixin {
  @JsonKey(name: 'holdings')
  final List<Asset> assets;
  final Decimal totalValue;
  final Iterable<AssetType> assetTypes;

  Holdings({
    required List<Asset> assets,
  })  : assets = UnmodifiableListView(assets),
        totalValue = assets.fold(
          Decimal.zero,
          (total, asset) => total + asset.value,
        ),
        assetTypes = UnmodifiableSetView(
          assets.map((asset) => asset.type).toSet(),
        );

  Holdings.empty() : this(assets: []);

  factory Holdings.fromJson(Map<String, dynamic> json) =>
      _$HoldingsFromJson(json);

  List<Asset> assetsOf({AssetType? type}) {
    return type == null
        ? assets
        : assets.where((asset) => asset.type == type).toList();
  }

  Decimal assetValue(AssetType type) {
    return assets
        .where((asset) => asset.type == type)
        .fold(Decimal.zero, (total, asset) => total + asset.value);
  }

  Rational assetPercentage(AssetType type) {
    return totalValue > Decimal.zero
        ? assetValue(type) / totalValue
        : Rational.zero;
  }

  Iterable<AssetsDistribution> assetDistribution() {
    return assetTypes.map((type) {
      return (
        type: type,
        value: assetValue(type),
        percentage: assetPercentage(type).toDouble() * 100,
      );
    });
  }

  @override
  List<Object?> get props => [assets];
}

typedef AssetsDistribution = ({
  AssetType type,
  Decimal value,
  num percentage,
});
