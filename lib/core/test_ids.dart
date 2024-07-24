class TestIds {
  static _CharacterList characterList = _CharacterList();
  static _CharacterView characterView = _CharacterView();

// Add other feature or screen related test IDs as needed
}

final class _CharacterList {
  final String screen = 'CharacterList.screen';
  final String loadingState = 'CharacterList.loadingState';
  final String errorState = 'CharacterList.errorState';
  final String list = 'CharacterList.list';
}

final class _CharacterView {
  final String screen = 'CharacterView.viewScreen';
}
