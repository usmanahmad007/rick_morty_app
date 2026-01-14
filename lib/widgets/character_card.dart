import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';
import '../controllers/character_controller.dart';
import '../controllers/favorites_controller.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final bool isFavoriteScreen; // true if used in Favorites Screen

  CharacterCard({
    required this.character,
    this.isFavoriteScreen = false,
    Key? key,
  }) : super(key: key);

  final CharacterController characterController = Get.find();
  final FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: character.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
            const CircularProgressIndicator(strokeWidth: 2),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(character.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
            Text('Location: ${character.location}'),
          ],
        ),
        trailing: Obx(() {
          return GestureDetector(
            onTap: () {
                favoritesController.toggleFavorite(character);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                character.isFavorite.value ? Icons.star : Icons.star_border,
                key: ValueKey(character.isFavorite.value),
                color: Colors.yellow[700],
              ),
            ),
          );
        }),


      ),
    );
  }
}
