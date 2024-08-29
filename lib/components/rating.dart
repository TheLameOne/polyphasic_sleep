import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;
  final Color color;
  const Rating({super.key, required this.rating, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < rating; i++)
          Icon(
            Icons.star_rounded,
            color: color,
            size: 28,
          ),
        for (int i = rating; i < 5; i++)
          const Icon(
            Icons.star_border_rounded,
            color: Colors.grey,
            size: 28,
          )
      ],
    );
  }
}
