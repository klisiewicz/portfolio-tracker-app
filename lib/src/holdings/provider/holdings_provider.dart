import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/asset.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings_repository.dart';
import 'package:portfolio_tracker_app/src/holdings/infrastructure/holdings_rest_repository.dart';
import 'package:portfolio_tracker_app/src/shared/infrastructure/dio_provider.dart';

final holdingsRepositoryProvider =
    Provider.autoDispose<HoldingsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HoldingsRestRepository(dio);
});

final userIdProvider = StateProvider.autoDispose<String?>((ref) {
  return null;
});

final holdingsProvider = FutureProvider.autoDispose<Holdings>((ref) async {
  final userId = ref.watch(userIdProvider);
  final repository = ref.watch(holdingsRepositoryProvider);
  if (userId == null || userId.isEmpty) return Holdings.empty();
  return repository.findByUser(userId);
});

final assetsProvider = Provider.autoDispose<List<Asset>>((ref) {
  final asyncHoldings = ref.watch(holdingsProvider);
  final assetType = ref.watch(assetTypeFilterProvider);
  return asyncHoldings.maybeWhen(
    data: (holdings) => holdings.assetsOf(type: assetType),
    orElse: () => [],
  );
});

final assetTypesProvider = Provider.autoDispose<Iterable<AssetType>>((ref) {
  final asyncHoldings = ref.watch(holdingsProvider);
  return asyncHoldings.maybeWhen(
    data: (holdings) => holdings.assetTypes,
    orElse: () => [],
  );
});

final assetsTotalValueProvider = Provider.autoDispose<Decimal>((ref) {
  final asyncHoldings = ref.watch(holdingsProvider);
  return asyncHoldings.maybeWhen(
    data: (holdings) => holdings.totalValue,
    orElse: () => Decimal.zero,
  );
});

final assetTypeFilterProvider = StateProvider.autoDispose<AssetType?>((ref) {
  return null;
});

final assetDistributionProvider =
    StateProvider.autoDispose<Iterable<AssetsDistribution>>((ref) {
  final asyncHoldings = ref.watch(holdingsProvider);
  return asyncHoldings.maybeWhen(
    data: (holdings) => holdings.assetDistribution(),
    orElse: () => [],
  );
});
