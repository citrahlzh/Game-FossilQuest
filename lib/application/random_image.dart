import 'dart:math';
import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  final String image;

  const RandomImage({required this.image});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final double top = random
        .nextInt(MediaQuery.of(context).size.height.toInt() - 200)
        .toDouble();
    final double left = random
        .nextInt(MediaQuery.of(context).size.width.toInt() - 250)
        .toDouble();

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
