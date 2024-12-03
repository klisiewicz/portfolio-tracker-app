import 'package:decimal/decimal.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';

Asset makeAsset({
  required AssetType type,
  String name = 'Scam',
  String ticker = 'XYZ',
  num value = 99.99,
}) {
  return Asset(
    ticker: ticker,
    name: name,
    type: type,
    value: Decimal.parse('$value'),
  );
}
