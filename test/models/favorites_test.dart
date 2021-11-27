import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group("Favorites class test", () {
    test('testing add function', () {
      int item = 10;
      final fav = Favorites();
      fav.add(item);

      expect(fav.items.contains(item), true);
    });

    test('removing an item', () {
      int item = 20;
      final fav = Favorites();
      fav.add(item);
      expect(fav.items.contains(item), true);
      fav.remove(item);
      expect(fav.items.contains(item), false);
    });
  });
}
