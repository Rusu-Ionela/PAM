import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating; // ex: 4.3
  final double size; // mărimea iconițelor
  final int max; // câte stele
  final Color color; // culoare stea plină / jumătate
  final Color emptyColor; // culoare stea goală

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 14,
    this.max = 5,
    this.color = const Color(0xFFFFC107), // amber
    this.emptyColor = const Color(0xFFBDBDBD), // grey
  });

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= 0.5;
    final empty = max - full - (hasHalf ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < full; i++)
          Icon(Icons.star, size: size, color: color),
        if (hasHalf) Icon(Icons.star_half, size: size, color: color),
        for (int i = 0; i < empty; i++)
          Icon(Icons.star_border, size: size, color: emptyColor),
      ],
    );
  }
}
