import 'package:flutter/material.dart';

class RowTextIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  const RowTextIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.purple,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
