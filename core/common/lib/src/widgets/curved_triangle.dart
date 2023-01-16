import 'package:flutter/material.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class TopCurvedTriangle extends CustomPainter {
  final Color color;

  TopCurvedTriangle(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(
        size.width * 0.0350000, size.height * 0.0296880, size.width, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomCurvedTriangle extends CustomPainter {
  final Color color;

  BottomCurvedTriangle(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.2500000, size.width, 0);
    path0.quadraticBezierTo(
        size.width * 0.9850000, size.height * 0.9806332, 0, size.height);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
