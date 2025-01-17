import 'package:flutter/material.dart';

import 'package:indieflow/core/index.dart' show Character;
import 'package:indieflow/features/common/index.dart' show CustomImage;

import 'package:indieflow/core/test_ids.dart';

class CharacterViewScreen extends StatelessWidget {
  final Character character;

  const CharacterViewScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(TestIds.characterView.screen),

      appBar: AppBar(title: Text(character.name),),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(url:character.image),
            const SizedBox(height: 16),
            Text('Name: ${character.name}', style: const TextStyle(fontSize: 18)),
            Text('Status: ${character.status}', style: const TextStyle(fontSize: 18)),
            Text('Species: ${character.species}', style: const TextStyle(fontSize: 18)),
            Text('Gender: ${character.gender}', style: const TextStyle(fontSize: 18)),
            Text('Origin: ${character.origin.name}', style: const TextStyle(fontSize: 18)),
            Text('Location: ${character.location.name}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
