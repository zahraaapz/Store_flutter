

import 'package:flutter/material.dart';

class Cut extends CustomClipper<Path> {
  double x, y;
  Cut({required this.x, required this.y});
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - x - y, 0)
      ..arcToPoint(Offset(size.width - x, 0),
          clockwise: false, radius: const Radius.circular(5))
      ..lineTo(size.width - 3 * x - y, 0)
      ..arcToPoint(Offset(size.width - 3 * x, 0),
          clockwise: false, radius: const Radius.circular(5))
      ..lineTo(size.width - 5.6 * x, 0)
      ..arcToPoint(Offset(size.width - 5 * x, 0),
          clockwise: false, radius: const Radius.circular(5))
      ..lineTo(size.width - 7.6 * x, 0)
      ..arcToPoint(Offset(size.width - 7 * x, 0),
          clockwise: false, radius: const Radius.circular(5))
      ..lineTo(size.width - 9.8 * x, 0)
      ..arcToPoint(Offset(size.width - 9.2 * x, 0),
          clockwise: false, radius: const Radius.circular(5))
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(Cut oldClipper) => true;
}