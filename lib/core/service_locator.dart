
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'dio_client/dio_client.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(setupDio());
}
