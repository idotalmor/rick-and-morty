import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/api_response.freezed.dart';
part 'generated/api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({
    required Info info,
    required List<T> results,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
class Info with _$Info {
  factory Info({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}
//dart run build_runner build --delete-conflicting-outputs