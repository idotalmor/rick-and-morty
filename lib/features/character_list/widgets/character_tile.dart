import 'package:flutter/material.dart';
import 'package:indieflow/core/index.dart';

class CharacterTile extends StatelessWidget {
  final Character model;
  final void Function(Character) onCharacterTap;

  const CharacterTile({super.key, required this.model, required this.onCharacterTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(model.image),
      title: Text(model.name),
      subtitle: Text(model.species),
      onTap: () => onCharacterTap(model),
    );
  }
}
