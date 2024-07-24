import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:indieflow/core/constants.dart' show characterEndpoint;
import 'package:indieflow/core/rickandmorty/models/index.dart' show ApiResponse, Character;

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
        throw Exception('Failed to load characters: ${e.response?.data ?? e.message}');
      } else {
        throw Exception('Failed to load characters: ${e.message}');
      }
    } catch (error) {
      throw Exception('Failed to load characters: $error');
    }
  }
}
