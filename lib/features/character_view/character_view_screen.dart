import 'package:flutter/material.dart';

import 'package:indieflow/core/index.dart' show Character;

class CharacterViewScreen extends StatelessWidget {
  final Character character;

  const CharacterViewScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name),),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(character.image),
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
