import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home widget Test -', () {
    testWidgets("Testing home page", (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('Testing icon button', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite_border), findsWidgets);

      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('shows message on tapping icon', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      var message = 'Added to favorites.';

      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byIcon(Icons.favorite), findsOneWidget);

      expect(find.text(message), findsOneWidget);
    });

    testWidgets('Listview scrolls', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);

      await tester.fling(find.byType(ListView), const Offset(0, -2000), 1500);
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsNothing);
    });
  });
}
