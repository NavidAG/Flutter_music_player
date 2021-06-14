import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MusicCardWidget extends CustomPainter {
  final List<Color> colors;

  MusicCardWidget({required this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.10),
        Offset(size.width * 0.50, size.height * 0.90),
        colors,
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1000000, size.height * 0.1000000);
    path_0.quadraticBezierTo(size.width * 0.7003300, size.height * 0.0991000,
        size.width * 0.9004400, size.height * 0.0988000);
    path_0.lineTo(size.width * 0.9000000, size.height * 0.3980000);
    path_0.quadraticBezierTo(size.width * 0.7996600, size.height * 0.4270600,
        size.width * 0.7995200, size.height * 0.4995000);
    path_0.quadraticBezierTo(size.width * 0.7999600, size.height * 0.5716200,
        size.width * 0.8980000, size.height * 0.6020000);
    path_0.lineTo(size.width * 0.9000000, size.height * 0.9020000);
    path_0.lineTo(size.width * 0.1000000, size.height * 0.9000000);
    path_0.quadraticBezierTo(size.width * 0.1000000, size.height * 0.7000000,
        size.width * 0.1000000, size.height * 0.1000000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
