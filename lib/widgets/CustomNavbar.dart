import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  final RxInt selectedIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: selectedIndex.value == 0
                    ? Colors.yellow[700]
                    : Colors.grey,
              ),
              label: 'Characters',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: selectedIndex.value == 1
                    ? Colors.yellow[700]
                    : Colors.grey,
              ),
              label: 'Favorites',
            ),
          ],
        );
      },
    );
  }
}
