import 'package:bookstore_app/models/book_model.dart';
import 'package:bookstore_app/models/favorite_model.dart';
import 'package:bookstore_app/screens/detail_screen.dart';
import 'package:bookstore_app/services/api_handler.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:bookstore_app/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          icon: Icons.arrow_back,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'All Books',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
        actions: [
          AppBarIcon(
            icon: Icons.shopping_cart_checkout,
            onPressed: () => '',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            FutureBuilder(
              future: APIHandler.getAllBooks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: {$snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: Text('There is no book right now'),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: BookCard(
                        icon: Icons.favorite_border_outlined,
                        onTapAddToFavorite: () {
                          Provider.of<FavoriteModel>(context, listen: false)
                              .addItemToFavorite(snapshot.data![index]);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Add to favorite'),
                            ),
                          );
                        },
                        onTapGoToDetail: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                isbn: snapshot.data![index].isbn13.toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
