import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('FavoritesTest -', () {
    final favorites = Favorites();
    test('Test Adding favorite', () {
      ///Given a number
      var item = 79;
      ///When athe number is added to the list
      favorites.add(item);
      //expect the lisst to contain the added number
      expect(favorites.items.contains(item), true);
    });

     test('Removing an element from favorites', () {
    ///Given a number, we add it to the list
      var item = 79;
      favorites.add(item);
      expect(favorites.items.contains(item), true);

      ///When the number is removed from the list
      favorites.remove(item);
      //expect the lisst to not contain the removed number
      expect(favorites.items.contains(item), false);
     });
  });
}
