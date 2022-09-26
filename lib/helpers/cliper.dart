import 'dart:math';

import 'package:flutter/material.dart';

class InBorderBotton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    final holePath = Path();

    // holePath.addArc(Rect.fromCircle(center: Offset(size.width - 300, 0), radius: 20), 0, 2 * pi);

    // for (var i = 0.0; i < size.height; i = i + 25) {
    //   holePath.addRect(Rect.fromPoints(Offset(size.width - 304, i), Offset(size.width - 296, i + 20)));
    // }
    holePath.addArc(Rect.fromCircle(center: Offset(20, size.height), radius: 20), 0, 2 * pi);
    holePath.addRect(Rect.fromPoints(Offset(20, size.height - 20), Offset(size.width - 20, size.height)));
    holePath.addArc(Rect.fromCircle(center: Offset(size.width - 20, size.height), radius: 20), 0, 2 * pi);

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
