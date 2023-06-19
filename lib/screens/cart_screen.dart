import 'package:bookstore_app/models/cart_model.dart';
import 'package:bookstore_app/models/single_book_model.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:bookstore_app/widgets/book_tile_vertical.dart';
import 'package:bookstore_app/widgets/book_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          leading: AppBarIcon(
              icon: Icons.arrow_back, onPressed: () => context.pop()),
          title: const Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          centerTitle: true,
        ),
        body: value.getUserCart().isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    BookTileVertical(
                      itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        SingleBookModel book = value.getUserCart()[index];
                        return BookTileCard(
                          icon: Icons.delete,
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .removeItemFromCart(value.getUserCart()[index]);
                          },
                          book: book,
                        );
                      },
                    ),
                    SlideAction(
                      innerColor: Colors.purple,
                      outerColor: Colors.purple[200],
                      sliderButtonIcon: const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: Text('Cart is empty'),
              ),
      ),
    );
  }
}
