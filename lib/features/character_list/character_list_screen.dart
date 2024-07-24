import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:indieflow/core/index.dart'
    show AppRoutes, AppRoutesExtension, Character;

import 'provider/index.dart' show CharacterPS, characterNotifierProvider;
import 'widgets/index.dart' show CharacterList, ErrorState, LoadingState;

class CharacterListScreen extends ConsumerWidget {
  const CharacterListScreen({super.key});

  void _onCharacterTap(BuildContext context, Character character) {
    Navigator.pushNamed(
      context,
      AppRoutes.character.route,
      arguments: character,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharacterPS characterState = ref.watch(characterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Characters')),
      body: characterState.when(
        loading: () => LoadingState(),
        error: (message) => ErrorState(
          message: message,
          onRetryPress:
              ref.read(characterNotifierProvider.notifier).loadCharacters,
        ),
        data: (characters, page, isLoadingMore, loadMoreError) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                ref.read(characterNotifierProvider.notifier).loadNextPage();
                return true;
              }
              return false;
            },
            child: CharacterList(
              characters: characters,
              isLoadingMore: isLoadingMore,
              loadMoreError: loadMoreError,
              onCharacterTap: (character) =>
                  _onCharacterTap(context, character),
            ),
          );
        },
        initial: () => SizedBox(),
      ),
    );
  }
}
