import 'package:flutter/material.dart';
import 'package:indieflow/core/rickandmorty/models/index.dart';

class CharacterTile extends StatelessWidget {
  final Character model;

  const CharacterTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(model.image),
      title: Text(model.name),
      subtitle: Text(model.species),
    );
  }
}
