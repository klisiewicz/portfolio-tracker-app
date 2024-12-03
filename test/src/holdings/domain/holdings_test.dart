import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings.dart';

import 'asset_fixture.dart';

void main() {
  test('should return total value of many small assets', () {
    final holdings = Holdings(
      assets: List.generate(1000, (i) {
        return makeAsset(ticker: '$i', type: AssetType.crypto, value: 0.001);
      }),
    );

    expect(holdings.totalValue, Decimal.parse('1'));
  });

  test('should return total value of large and small assets', () {
    final holdings = Holdings(
      assets: [
        makeAsset(ticker: 'BIG1', type: AssetType.realEstate, value: 1e12),
        makeAsset(ticker: 'BIG2', type: AssetType.realEstate, value: 2e12),
        makeAsset(ticker: 'SMALL1', type: AssetType.crypto, value: 0.0001),
        makeAsset(ticker: 'SMALL2', type: AssetType.crypto, value: 0.0002),
      ],
    );

    expect(holdings.totalValue, Decimal.parse('3000000000000.0003'));
  });

  test('should return a total value for a given asset', () {
    final holdings = Holdings(
      assets: [
        makeAsset(ticker: 'BIG1', type: AssetType.realEstate, value: 1e6),
        makeAsset(ticker: 'BIG2', type: AssetType.realEstate, value: 2e6),
        makeAsset(ticker: 'SMALL1', type: AssetType.crypto, value: 0.0001),
        makeAsset(ticker: 'SMALL2', type: AssetType.crypto, value: 0.0002),
      ],
    );

    expect(holdings.assetValue(AssetType.realEstate), Decimal.parse('3000000'));
    expect(holdings.assetValue(AssetType.crypto), Decimal.parse('0.0003'));
    expect(holdings.assetValue(AssetType.bonds), Decimal.zero);
  });

  test('should return asset percentage share in holdings', () {});

  test('should return available asset types', () {
    final holdings = Holdings(
      assets: [
        makeAsset(type: AssetType.bonds),
        makeAsset(type: AssetType.crypto),
        makeAsset(type: AssetType.stock),
      ],
    );

    expect(
      holdings.assetTypes,
      allOf(
        [
          containsAll([AssetType.bonds, AssetType.crypto, AssetType.stock]),
          isNot(
            containsAll([AssetType.defi, AssetType.nft, AssetType.realEstate]),
          ),
        ],
      ),
    );
  });
}
