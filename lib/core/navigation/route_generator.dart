import 'package:flutter/material.dart';

import 'routes.dart';
import 'package:indieflow/core/index.dart' show Character;
import 'package:indieflow/features/index.dart' show CharacterListScreen, CharacterViewScreen;

Route<dynamic>? generateRoute(RouteSettings settings) {
  final AppRoutes? route = AppRoutesExtension.fromRoute(settings.name);

  switch (route) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const CharacterListScreen());
    case AppRoutes.character:
      final character = settings.arguments as Character;
      return MaterialPageRoute(builder: (context) => CharacterViewScreen(character: character));
    default:
      return null;
  }
}
