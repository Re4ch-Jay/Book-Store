import 'package:bookstore_app/models/single_book_model.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';

class BookTileCard extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final SingleBookModel book;
  const BookTileCard({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        tileColor: Colors.purple[50],
        leading: Image.network(book.image!),
        title: Text(book.title!.toString()),
        subtitle: Text('Price: ${book.price}'),
        trailing: AppBarIcon(icon: icon, onPressed: onPressed),
      ),
    );
  }
}
