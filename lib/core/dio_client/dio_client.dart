
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

import 'package:indieflow/core/constants.dart' show baseUrl;

Future<Dio> setupDio()async {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
  var cacheDir = await getTemporaryDirectory();

  final cacheInterceptor = DioCacheInterceptor(
    options: CacheOptions(
      store: HiveCacheStore(cacheDir.path,),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: Duration(days: 7),
    ),
  );

  dio.interceptors.add(cacheInterceptor);
  return dio;
}
