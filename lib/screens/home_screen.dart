import 'package:bookstore_app/widgets/book_horizon_list.dart';
import 'package:bookstore_app/widgets/row_text_icon.dart';
import 'package:bookstore_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SearchBar(textEditingController: _textEditingController),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowTextIcon(
                    title: 'All Books',
                    icon: Icons.arrow_forward,
                    onPressed: () => context.push('/books'),
                  ),
                  const RowTextIcon(
                    title: 'New & Trending',
                    icon: Icons.trending_up,
                  ),
                  const BookHorizonList(),
                  const RowTextIcon(
                    title: 'Popular Books',
                    icon: Icons.book,
                  ),
                  const BookHorizonList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
