import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../widgets/character_card.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sorting Dropdown
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          const Text(
            'Sort by',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<SortBy>(
                    value: favoritesController.sortBy.value,
                    isExpanded: true,
                    icon: const Icon(Icons.sort),
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor:
                    Theme.of(context).colorScheme.surface,
                    onChanged: (value) {
                      if (value != null) {
                        favoritesController.changeSort(value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: SortBy.name,
                        child: _DropdownItem(
                          icon: Icons.person,
                          label: 'Name',
                        ),
                      ),
                      DropdownMenuItem(
                        value: SortBy.status,
                        child: _DropdownItem(
                          icon: Icons.info_outline,
                          label: 'Status',
                        ),
                      ),
                      DropdownMenuItem(
                        value: SortBy.species,
                        child: _DropdownItem(
                          icon: Icons.pets,
                          label: 'Species',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    ),

    // Favorites list
          Expanded(
            child: Obx(() {
              final favorites = favoritesController.favorites;

              if (favorites.isEmpty) {
                return const Center(
                  child:
                  Text('No favorites yet!', style: TextStyle(fontSize: 18)),
                );
              }

              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final character = favorites[index];
                  return CharacterCard(
                    character: character,
                    isFavoriteScreen: true,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

}
class _DropdownItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DropdownItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

