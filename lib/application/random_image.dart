import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  final String image;
  final Offset position;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  const RandomImage(
      {super.key, required this.image,
      required this.position,
      this.onTap,
      this.onDoubleTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        child: Image.network(
          image,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}