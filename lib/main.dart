import 'package:bookstore_app/models/cart_model.dart';
import 'package:bookstore_app/models/favorite_model.dart';
import 'package:bookstore_app/screens/all_books_screen.dart';
import 'package:bookstore_app/screens/cart_screen.dart';

import 'package:flutter/material.dart';
import 'package:bookstore_app/screens/layout_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => CartModel(),
        ),
        ListenableProvider(
          create: (context) => FavoriteModel(),
        ),
      ],
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData.light(useMaterial3: true).copyWith(
          primaryColor: Colors.purple,
          iconTheme: const IconThemeData(
            color: Colors.purple,
          ),
          primaryIconTheme: const IconThemeData(color: Colors.purple),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              name: '/',
              path: '/',
              builder: (context, state) => const LayoutScreen(),
            ),
            GoRoute(
              name: '/cart',
              path: '/cart',
              builder: (context, state) => const CartScreen(),
            ),
            GoRoute(
              name: '/books',
              path: '/books',
              builder: (context, state) => const AllBooksScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
