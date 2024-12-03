import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/config/env_config_provider.dart';
import 'package:portfolio_tracker_app/src/shared/infrastructure/dio_interceptors.dart';

final dioProvider = Provider.autoDispose<Dio>((Ref ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
  dio.interceptors.addAll([
    FormatRequestInterceptor(),
  ]);
  return dio;
});
