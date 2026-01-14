import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/character_controller.dart';
import '../controllers/favorites_controller.dart';
import '../theme/theme_controller.dart';
import '../widgets/CustomNavbar.dart';
import 'character_screen.dart';
import 'favorites_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final CharacterController characterController = Get.put(CharacterController());
  final FavoritesController favoritesController = Get.put(FavoritesController());
  final ThemeController themeController = Get.find();

  final RxInt selectedIndex = 0.obs; // Start at Characters

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      CharacterScreen(),
      FavoritesScreen(),
    ];

    return Obx(
          () => Scaffold(
        appBar: AppBar(
          title: Text(selectedIndex.value == 0
              ? 'Rick and Morty Characters'
              : 'Favorites'),
          actions: [
            IconButton(
              icon: Icon(themeController.themeMode.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () => themeController.toggleTheme(),
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedIndex.value,
          children: screens,
        ),
        bottomNavigationBar: CustomNavbar(
          selectedIndex: selectedIndex,
          onTap: (index) => selectedIndex.value = index,
        ),
      ),
    );
  }
}
