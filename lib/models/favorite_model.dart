import 'package:bookstore_app/models/book_model.dart';
import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  // user favorite list

  final List<BookModel> _userFavorite = [];
  // get user favorite list

  List<BookModel> getUserFavorite() {
    return _userFavorite;
  }

  // add item to favorite list

  void addItemToFavorite(BookModel bookModel) {
    _userFavorite.add(bookModel);
    notifyListeners();
  }

  // remove item from favorite list

  void removeItemFromFavorite(BookModel bookModel) {
    _userFavorite.remove(bookModel);
    notifyListeners();
  }
}
