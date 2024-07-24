import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:indieflow/core/rickandmorty/index.dart' show characterNotifierProvider, CharacterPS;

import 'widgets/index.dart' show CharacterList, ErrorState, LoadingState;

class CharacterListScreen extends ConsumerWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharacterPS characterState = ref.watch(characterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Characters')),
      body: characterState.when(
        loading: () => LoadingState(),
        error: (message) => ErrorState(message: message),
        data: (characters, page, isLoadingMore, loadMoreError) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
                ref.read(characterNotifierProvider.notifier).loadNextPage();
                return true;
              }
              return false;
            },
            child: CharacterList(
              characters: characters,
              isLoadingMore: isLoadingMore,
              loadMoreError: loadMoreError,
            ),
          );
        },
        initial: () => SizedBox(),
      ),
    );
  }
}
