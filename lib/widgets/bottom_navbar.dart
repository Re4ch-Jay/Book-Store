import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTapChange;
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    this.onTapChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabMargin: const EdgeInsets.all(8),
      backgroundColor: Colors.transparent,
      tabActiveBorder: Border.all(color: Colors.purple.shade200),
      activeColor: Colors.purple,
      color: Colors.purple[200],
      gap: 1,
      mainAxisAlignment: MainAxisAlignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: const Duration(milliseconds: 400),
      selectedIndex: selectedIndex,
      onTabChange: (value) => onTapChange!(value),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Favorites',
        ),
        GButton(
          icon: Icons.person,
          text: 'User',
        ),
      ],
    );
  }
}
