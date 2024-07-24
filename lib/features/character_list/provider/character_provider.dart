import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indieflow/core/character/api/character_api.dart';
import 'models/character_ps.dart';

final characterNotifierProvider = StateNotifierProvider<CharacterNotifier, CharacterPS>((ref) {
  return CharacterNotifier(CharacterApi());
});

class CharacterNotifier extends StateNotifier<CharacterPS> {
  final CharacterApi _characterApi;

  CharacterNotifier(this._characterApi) : super(const CharacterPS.initial()){
    loadCharacters();
  }

  Future<void> loadCharacters([int page = 1]) async {
    if (page == 1) {
      state = const CharacterPS.loading();
    } else {
      state = state.maybeWhen(
        data: (characters, currentPage, _, __) => CharacterPS.data(
          characters: characters,
          page: currentPage,
          isLoadingMore: true,
          loadMoreError: null,
        ),
        orElse: () => state,
      );
    }

    try {
      final response = await _characterApi.fetchCharacters(page);
      state = state.maybeWhen(
        data: (characters, currentPage, _, __) => CharacterPS.data(
          characters: [...characters, ...response.results],
          page: page,
          isLoadingMore: false,
          loadMoreError: null,
        ),
        orElse: () => CharacterPS.data(characters:response.results, page:page, isLoadingMore: false),
      );
    } catch (e) {
      if (page == 1) {
        state = CharacterPS.error(e.toString());
      } else {
        state = state.maybeWhen(
          data: (characters, currentPage, _, __) => CharacterPS.data(
            characters: characters,
            page: currentPage,
            isLoadingMore: false,
            loadMoreError: e.toString(),
          ),
          orElse: () => state,
        );
      }
    }
  }

  Future<void> loadNextPage() async {
    state.maybeWhen(
      data: (characters, page, _, __) => loadCharacters(page + 1),
      orElse: () {},
    );
  }
}
