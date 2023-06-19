import 'package:bookstore_app/screens/favorite_screen.dart';
import 'package:bookstore_app/screens/home_screen.dart';
import 'package:bookstore_app/screens/profile_screen.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:bookstore_app/widgets/bottom_navbar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({
    super.key,
  });

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcon(
            icon: Icons.menu,
            onPressed: () => '',
          ),
          title: const Text(
            'The Book Store',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          centerTitle: true,
          actions: [
            AppBarIcon(
              icon: Icons.shopping_cart_checkout,
              onPressed: () => context.push('/cart'),
            ),
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTapChange: (index) => navigateBottomBar(index),
        ),
      ),
    );
  }
}
