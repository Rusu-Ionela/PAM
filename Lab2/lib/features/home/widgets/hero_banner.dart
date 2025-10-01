import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final double height;
  final ImageProvider background;
  final String title;

  const HeroBanner({
    super.key,
    required this.height,
    required this.background,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // imagine fundal
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image(image: background, fit: BoxFit.cover),
          ),
          // gradient pentru lizibilitate
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
          ),
          // titlu
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
