import 'dart:convert';

import 'package:bookstore_app/models/book_model.dart';
import 'package:bookstore_app/models/single_book_model.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  static Future<List<BookModel>> getAllBooks() async {
    Uri uri = Uri.https('api.itbook.store', '/1.0/new');
    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    List<BookModel> bookList = [];

    for (var eachData in data['books']) {
      final book = BookModel(
        image: eachData['image'],
        isbn13: eachData['isbn13'],
        price: eachData['price'],
        subtitle: eachData['subtitle'],
        title: eachData['title'],
        url: eachData['url'],
      );
      bookList.add(book);
    }

    return bookList;
  }

  static Future<SingleBookModel> getSingleBook({required String isbn}) async {
    Uri uri = Uri.https('api.itbook.store', '/1.0/books/$isbn');
    var response = await http.get(uri);
    var data = jsonDecode(response.body);
    return SingleBookModel.fromJson(data);
  }
}
