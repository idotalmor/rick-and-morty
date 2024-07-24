enum AppRoutes {
  home,
  character,
}

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.character:
        return '/character';
      default:
        return '/';
    }
  }

  static AppRoutes? fromRoute(String? route) {
    switch (route) {
      case '/':
        return AppRoutes.home;
      case '/character':
        return AppRoutes.character;
      default:
        return null;
    }
  }
}
