import 'package:flutter/material.dart';

class BookTileVertical extends StatelessWidget {
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;

  const BookTileVertical({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
