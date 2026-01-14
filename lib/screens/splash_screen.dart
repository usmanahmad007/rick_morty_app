import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/character_controller.dart';
import '../controllers/favorites_controller.dart';
import '../screens/main_screen.dart';
import '../services/hive_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Open Hive boxes
    await HiveService.init();

    // Initialize controllers
    Get.put(CharacterController());
    Get.put(FavoritesController());

    // Navigate to MainScreen after initialization
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.black,),
      ),
    );
  }
}
