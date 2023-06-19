import 'package:bookstore_app/models/cart_model.dart';
import 'package:bookstore_app/services/api_handler.dart';
import 'package:bookstore_app/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String isbn;
  const DetailScreen({super.key, required this.isbn});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          icon: Icons.arrow_back,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Book Detail',
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: APIHandler.getSingleBook(isbn: isbn),
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
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.50,
                            width: double.infinity,
                            child: FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: snapshot.data!.image.toString(),
                              errorWidget: const Icon(
                                Icons.dangerous,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data!.title.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.purple[200],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.subtitle.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.purple[200],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price: ${snapshot.data!.price.toString()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rating: ${snapshot.data!.rating.toString()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                              'Published Year: ${snapshot.data!.year.toString()}'),
                          Text('Author: ${snapshot.data!.authors.toString()}'),
                          Text('Pages: ${snapshot.data!.pages.toString()}'),
                          const Divider(),
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.purple[200],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data!.desc.toString(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FutureBuilder(
        future: APIHandler.getSingleBook(isbn: isbn),
        builder: (context, snapshot) {
          return FloatingActionButton(
            onPressed: () {
              Provider.of<CartModel>(context, listen: false)
                  .addItemToCart(snapshot.data!);
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text('Success added to cart'),
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
