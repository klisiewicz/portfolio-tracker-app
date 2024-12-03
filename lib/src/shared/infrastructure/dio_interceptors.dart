import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

@immutable
final class FormatRequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['format'] = 'json';
    return super.onRequest(options, handler);
  }
}
