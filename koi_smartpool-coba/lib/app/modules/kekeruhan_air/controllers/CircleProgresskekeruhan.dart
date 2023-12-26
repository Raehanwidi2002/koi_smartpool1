import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgresskekeruhan extends CustomPainter {
  final strokeCircle = 17.0;
  double currentProgress;

  CircleProgresskekeruhan(this.currentProgress);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 100;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = Color(0xFFFA8BC7)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / 50);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
