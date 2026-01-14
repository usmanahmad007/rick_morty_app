import 'package:get/get.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../services/hive_service.dart';

class CharacterController extends GetxController {
  var characters = <Character>[].obs;
  var page = 1;
  var isLoading = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCharacters();
  }

  Future<void> loadCharacters({bool refresh = false}) async {
    if (refresh) {
      page = 1;
      characters.clear();
      hasMore.value = true;
    }

    if (!hasMore.value) return;

    try {
      isLoading.value = true;
      List<Character> newCharacters = [];

      try {
        newCharacters = await ApiService.fetchCharacters(page: page);
        await HiveService.saveCharacters(newCharacters);
      } catch (e) {
        if (page == 1) newCharacters = HiveService.getCachedCharacters();
      }

      for (var c in newCharacters) {
        c.isFavorite.value = HiveService.isFavorite(c.id);
      }

      if (newCharacters.isEmpty) {
        hasMore.value = false;
      } else {
        characters.addAll(newCharacters);
        page++;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(Character character) async {
    if (character.isFavorite.value) {
      await HiveService.removeFavorite(character.id);
      character.isFavorite.value = false;
    } else {
      await HiveService.addFavorite(character.id);
      character.isFavorite.value = true;
    }
  }


}
