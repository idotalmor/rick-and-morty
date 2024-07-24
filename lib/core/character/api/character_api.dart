import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants.dart' show characterEndpoint, fetchCharactersError;
import '../models/character.dart';

import 'package:indieflow/core/index.dart' show ApiResponse;


class CharacterApi {
  final Dio _dio = GetIt.instance<Dio>();

  Future<ApiResponse<Character>> fetchCharacters(int page) async {
    try {
      final response = await _dio.get(characterEndpoint, queryParameters: {'page': page},);
      return ApiResponse<Character>.fromJson(
        response.data,
            (json) => Character.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('${fetchCharactersError}: ${e.response?.data ?? e.message}');
      } else {
        throw Exception('${fetchCharactersError}: ${e.message}');
      }
    } catch (error) {
      throw Exception('${fetchCharactersError}: $error');
    }
  }
}
