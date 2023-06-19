import 'package:bookstore_app/screens/detail_screen.dart';
import 'package:bookstore_app/services/api_handler.dart';
import 'package:bookstore_app/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookHorizonList extends StatelessWidget {
  const BookHorizonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: FutureBuilder(
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
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) =>
                ChangeNotifierProvider.value(
              value: snapshot.data![index],
              child: BookCard(
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
          );
        },
      ),
    );
  }
}
