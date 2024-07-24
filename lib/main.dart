import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/index.dart' show Character, setupLocator;
import 'features/index.dart' show CharacterListScreen, CharacterViewScreen;

void main() {
  setupLocator();
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CharacterListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/character') {
          final character = settings.arguments as Character;
          return MaterialPageRoute(
            builder: (context) {
              return CharacterViewScreen(character: character);
            },
          );
        }
        return null;
      },
    );
  }
}