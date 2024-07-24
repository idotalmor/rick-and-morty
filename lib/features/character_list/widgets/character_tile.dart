import 'package:flutter/material.dart';

import 'package:indieflow/core/index.dart' show Character;
import 'package:indieflow/features/common/index.dart' show CustomImage;

class CharacterTile extends StatelessWidget {
  final Character model;
  final void Function(Character) onCharacterTap;

  const CharacterTile(
      {super.key, required this.model, required this.onCharacterTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomImage(
        key: ValueKey(model.image),
        url: model.image,
        width: 50,
        height: 50,
      ),
      title: Text(model.name),
      subtitle: Text(model.species),
      onTap: () => onCharacterTap(model),
    );
  }
}
