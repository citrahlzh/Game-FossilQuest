import 'dart:math';
import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  final String image;

  const RandomImage({required this.image});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final double top = random.nextDouble() * (MediaQuery.of(context).size.height - 100);
    final double left = random.nextDouble() * (MediaQuery.of(context).size.width - 100);

    return Positioned(
      top: top,
      left: left,
      child: Image.network(
        image,
        width: 100,
        height: 100,
      ),
    );
  }
}
