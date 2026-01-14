import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs;

  ThemeData get lightTheme => ThemeData.light().copyWith(
    primaryColor: Colors.green,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
  );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
    primaryColor: Colors.green,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
  );

  void toggleTheme() {
    themeMode.value =
    themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
