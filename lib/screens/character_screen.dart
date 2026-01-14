import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/character_controller.dart';
import '../widgets/character_card.dart';

class CharacterScreen extends StatelessWidget {
  CharacterScreen({Key? key}) : super(key: key);

  final CharacterController characterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (characterController.characters.isEmpty &&
          characterController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (!characterController.isLoading.value &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            characterController.loadCharacters();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () => characterController.loadCharacters(refresh: true),
          child: ListView.builder(
            itemCount: characterController.characters.length +
                (characterController.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < characterController.characters.length) {
                final character = characterController.characters[index];
                return CharacterCard(character: character);
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ),
      );
    });
  }
}
