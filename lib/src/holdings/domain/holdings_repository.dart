import 'package:portfolio_tracker_app/src/holdings/domain/holdings.dart';

abstract interface class HoldingsRepository {
  Future<Holdings> findByUser(String userId);
}
