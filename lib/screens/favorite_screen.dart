import 'package:bookstore_app/models/book_model.dart';
import 'package:bookstore_app/models/favorite_model.dart';

import 'package:bookstore_app/widgets/book_tile_vertical.dart';
import 'package:bookstore_app/widgets/favorite_book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteModel>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(15),
        child: BookTileVertical(
          itemCount: value.getUserFavorite().length,
          itemBuilder: (context, index) {
            BookModel book = value.getUserFavorite()[index];
            return FavoriteBookTile(
              icon: Icons.favorite,
              onPressed: () =>
                  Provider.of<FavoriteModel>(context, listen: false)
                      .removeItemFromFavorite(book),
              book: book,
            );
          },
        ),
      ),
    );
  }
}
