import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:portfolio_tracker_app/src/l10n/localization.dart';
import 'package:portfolio_tracker_app/src/shared/infrastructure/json_coverters.dart';

part 'asset.g.dart';

@JsonSerializable(
  createToJson: false,
)
@immutable
final class Asset with EquatableMixin {
  final String ticker;
  final String name;
  @JsonKey(unknownEnumValue: AssetType.unknown)
  final AssetType type;
  @DecimalNumConverter()
  final Decimal value;

  const Asset({
    required this.ticker,
    required this.name,
    required this.type,
    required this.value,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  @override
  List<Object?> get props => [ticker, name, type, value];
}

enum AssetType {
  @JsonValue('bonds')
  bonds,
  @JsonValue('crypto')
  crypto,
  @JsonValue('defi')
  defi,
  @JsonValue('nft')
  nft,
  @JsonValue('stock')
  stock,
  @JsonValue('real_estate')
  realEstate,
  unknown,
}

extension AssetTypeLocalization on AssetType {
  String getLabel(Localization text) {
    return switch (this) {
      AssetType.bonds => text.assetBonds,
      AssetType.crypto => text.assetCrypto,
      AssetType.defi => text.assetDeFi,
      AssetType.nft => text.assetNft,
      AssetType.stock => text.assetStock,
      AssetType.realEstate => text.assetRealEstate,
      AssetType.unknown => text.assetUnknown,
    };
  }
}
