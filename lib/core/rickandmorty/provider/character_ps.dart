import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:indieflow/core/rickandmorty/models/index.dart';

part 'character_ps.freezed.dart';

@freezed
class CharacterPS with _$CharacterPS {
  const factory CharacterPS.initial() = _Initial;
  const factory CharacterPS.loading() = _Loading;
  const factory CharacterPS.error(String message) = _Error;
  const factory CharacterPS.data({
    required List<Character> characters,
    required int page,
    @Default(false) bool isLoadingMore,
    @Default(null) String? loadMoreError,
  }) = _Data;
}
