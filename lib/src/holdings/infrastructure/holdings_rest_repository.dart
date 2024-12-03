import 'package:dio/dio.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings_exception.dart';
import 'package:portfolio_tracker_app/src/holdings/domain/holdings_repository.dart';

final class HoldingsRestRepository implements HoldingsRepository {
  final Dio _dio;

  HoldingsRestRepository(Dio dio) : _dio = dio;

  @override
  Future<Holdings> findByUser(String userId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/api/v1/portfolio/$userId');
      final responseData = response.data;
      if (responseData == null) throw HoldingsException.notFound(userId);
      return Holdings.fromJson(responseData);
    } on DioException catch (ex) {
      if (ex.response?.statusCode == 404) {
        throw HoldingsException.notFound(userId);
      }
      throw HoldingsException.unknown(ex);
    } catch (ex) {
      throw HoldingsException.unknown(ex);
    }
  }
}
