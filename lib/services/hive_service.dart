import 'package:hive/hive.dart';

import '../models/character.dart';

class HiveService {
  static const String characterBoxName = 'characters';
  static const String favoriteBoxName = 'favorites';

  static Future<void> init() async {
    await Hive.openBox<Character>(characterBoxName);
    await Hive.openBox<int>(favoriteBoxName); // ✅ store IDs only
  }

  /// Cache characters
  static Future<void> saveCharacters(List<Character> characters) async {
    final box = Hive.box<Character>(characterBoxName);
    for (var character in characters) {
      box.put(character.id, character);
    }
  }

  /// Get cached characters
  static List<Character> getCachedCharacters() {
    return Hive.box<Character>(characterBoxName).values.toList();
  }

  /// Add favorite (ONLY ID)
  static Future<void> addFavorite(int characterId) async {
    final box = Hive.box<int>(favoriteBoxName);
    await box.put(characterId, characterId);
  }

  /// Remove favorite
  static Future<void> removeFavorite(int characterId) async {
    final box = Hive.box<int>(favoriteBoxName);
    await box.delete(characterId);
  }

  /// Check favorite
  static bool isFavorite(int id) {
    return Hive.box<int>(favoriteBoxName).containsKey(id);
  }

  /// Get favorite IDs
  static List<int> getFavoriteIds() {
    return Hive.box<int>(favoriteBoxName).values.toList();
  }
}
