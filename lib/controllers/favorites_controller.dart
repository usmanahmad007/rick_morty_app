import 'package:get/get.dart';
import '../models/character.dart';
import '../services/hive_service.dart';
import 'character_controller.dart';

enum SortBy { name, status, species }

class FavoritesController extends GetxController {
  final CharacterController characterController = Get.find();

  var favorites = <Character>[].obs;
  var sortBy = SortBy.name.obs;

  @override
  void onInit() {
    super.onInit();

    // Sync favorites whenever characters change
    ever(characterController.characters, (_) => syncFavorites());

    syncFavorites();
  }

  void toggleFavorite(Character character) async {
    if (character.isFavorite.value) {
      // REMOVE from favorites
      await HiveService.removeFavorite(character.id);
      character.isFavorite.value = false;
      favorites.removeWhere((c) => c.id == character.id);
    } else {
      // ADD to favorites
      await HiveService.addFavorite(character.id);
      character.isFavorite.value = true;
      favorites.add(character);
    }

    sortFavorites();
  }

  /// Build favorites list from character source of truth
  void syncFavorites() {
    favorites.value = characterController.characters
        .where((c) => c.isFavorite.value)
        .toList();

    sortFavorites();
  }

  /// Sorting logic only
  void sortFavorites() {
    favorites.sort((a, b) {
      switch (sortBy.value) {
        case SortBy.name:
          return a.name.compareTo(b.name);
        case SortBy.status:
          return a.status.compareTo(b.status);
        case SortBy.species:
          return a.species.compareTo(b.species);
      }
    });
    favorites.refresh();
  }

  void changeSort(SortBy newSort) {
    sortBy.value = newSort;
    sortFavorites();
  }
}
