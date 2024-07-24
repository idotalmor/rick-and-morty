
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:indieflow/core/constants.dart' show baseUrl;

Dio setupDio() {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  final cacheInterceptor = DioCacheInterceptor(
    options: CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: Duration(days: 7),
    ),
  );

  dio.interceptors.add(cacheInterceptor);
  return dio;
}
