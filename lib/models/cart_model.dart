import 'package:bookstore_app/models/book_model.dart';
import 'package:bookstore_app/models/single_book_model.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // user cart

  final List<SingleBookModel> _userCart = [];

  // get user cart

  List<SingleBookModel> getUserCart() {
    return _userCart;
  }

  // add item to cart

  void addItemToCart(SingleBookModel bookModel) {
    _userCart.add(bookModel);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(SingleBookModel bookModel) {
    _userCart.remove(bookModel);
    notifyListeners();
  }
}
