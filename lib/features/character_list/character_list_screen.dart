import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indieflow/core/rickandmorty/provider/character_provider.dart';
import 'package:indieflow/core/rickandmorty/provider/character_ps.dart';


class CharacterListScreen extends ConsumerWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CharacterPS characterState = ref.watch(characterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Characters'),),
      body: characterState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (message) => Center(child: Text('Error: $message')),
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
            child: ListView.builder(
              itemCount: characters.length + (isLoadingMore || loadMoreError != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == characters.length) {
                  if (isLoadingMore) {
                    return Center(child: CircularProgressIndicator());
                  } else if (loadMoreError != null) {
                    return Center(child: Text('Error loading more: $loadMoreError'));
                  }
                }
                final character = characters[index];
                return ListTile(
                  leading: Image.network(character.image),
                  title: Text(character.name),
                  subtitle: Text(character.status),
                );
              },
            ),
          );
        }, initial: () {},
      ),
    );
  }
}
