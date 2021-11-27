@TestOn('vm')

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home.dart';

//The createHomeScreen() function is used to create an app that loads the widget to be tested in a MaterialApp,
//wrapped into a ChangeNotifierProvider. The HomePage widget needs both of these widgets to be present above it in the widget
//tree so it can inherit from them and get access to the data they offer. This function is passed as a parameter to the pumpWidget() function.

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
void main() {
  //Widget testing uses the testWidget() function instead of the test() function.
  //It also takes two parameters: the description, and the callback. But here, the callback takes a WidgetTester as an argument.
  //pumpWidget kicks off the process by telling the framework to mount
  //and measure a particular widget just as it would in a complete application.
  group('HomeTest -', () {
    testWidgets('Test to check whethet ListView shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('Test scrolling on the home page', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testing Icon Button', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
  expect(find.byIcon(Icons.favorite), findsWidgets);
  await tester.tap(find.byIcon(Icons.favorite).first);
  await tester.pumpAndSettle(Duration(seconds: 1));
  expect(find.text('Removed from favorites.'), findsOneWidget);
  expect(find.byIcon(Icons.favorite), findsNothing);













    });
  });
}


