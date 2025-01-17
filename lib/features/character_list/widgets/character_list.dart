import 'package:flutter/material.dart';

import 'package:indieflow/core/index.dart' show Character;

import 'character_tile.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final bool isLoadingMore;
  final String? loadMoreError;
  final void Function(Character) onCharacterTap;

  const CharacterList({
    super.key,
    required this.characters,
    required this.isLoadingMore,
    required this.loadMoreError,
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          characters.length + (isLoadingMore || loadMoreError != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == characters.length) {
          if (isLoadingMore) {
            return Center(child: CircularProgressIndicator());
          } else if (loadMoreError != null) {
            return Center(child: Text('Error loading more: $loadMoreError'));
          }
        }
        final character = characters[index];
        return CharacterTile(
          key: ValueKey(character.id),
          model: character,
          onCharacterTap: onCharacterTap,
        );
      },
    );
  }
}
