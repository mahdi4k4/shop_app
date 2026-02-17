import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget navIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.orange : Colors.white,
        size: 28,
      ),
      onPressed: () => onTap(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navIcon(Icons.home, 0),
          navIcon(Icons.shopping_cart, 1),
          navIcon(Icons.person, 2),
          navIcon(Icons.settings, 3),
        ],
      ),
    );
  }
}
