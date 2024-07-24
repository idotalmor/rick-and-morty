import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:indieflow/core/test_ids.dart';

import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'package:indieflow/core/index.dart' show setupLocator;
import 'package:indieflow/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupLocator();
  });

  tearDownAll(() {
    GetIt.I.reset();
  });

  testWidgets('skeleton test', (WidgetTester tester) async {

    await tester.pumpWidget(const ProviderScope(child:MyApp()));

    expect(find.byKey(ValueKey(TestIds.characterList.screen)), findsOneWidget);

    expect(find.byKey(ValueKey(TestIds.characterList.loadingState)), findsOneWidget);
    await tester.pumpAndSettle();

    expect(find.byKey(ValueKey(TestIds.characterList.list)), findsOneWidget);

    const rick = 'Rick Sanchez';
    expect(find.text(rick), findsOneWidget);
    await tester.tap(find.text(rick));

    await tester.pumpAndSettle();

    expect(find.byKey(ValueKey(TestIds.characterList.screen)), findsNothing);

    expect(find.byKey(ValueKey(TestIds.characterView.screen)), findsOneWidget);

    expect(find.text(rick), findsOneWidget);

  });
}

//flutter test integration_test/app_test.dart