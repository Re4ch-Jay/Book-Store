import 'package:bookstore_app/models/book_model.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  final VoidCallback onTapGoToDetail;
  final VoidCallback? onTapAddToFavorite;
  final IconData? icon;
  const BookCard({
    super.key,
    required this.onTapGoToDetail,
    this.onTapAddToFavorite,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    BookModel bookModelProvider = Provider.of<BookModel>(context);
    String? currentRoute = ModalRoute.of(context)!.settings.name;
    bool isCurrentRoute() {
      return currentRoute == '/books';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTapGoToDetail,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(5),
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 10,
                child: ClipRRect(
                  child: Image.network(bookModelProvider.image!),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  bookModelProvider.price!,
                  overflow: !isCurrentRoute() ? TextOverflow.ellipsis : null,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              isCurrentRoute()
                  ? AppBarIcon(
                      icon: icon!,
                      onPressed: onTapAddToFavorite!,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
