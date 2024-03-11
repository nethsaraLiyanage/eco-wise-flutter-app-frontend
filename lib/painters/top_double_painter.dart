import 'package:flutter/material.dart';

class TopDoublePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint();
    paint.color = const Color.fromARGB(255, 18, 220, 0);

    final borderPaint = Paint();
    borderPaint.color = Colors.black;
    borderPaint.style = PaintingStyle.stroke;
    borderPaint.strokeWidth = 1;

    Path bottomCircle = Path();
    bottomCircle.moveTo(0, height * 0.37);

    bottomCircle.quadraticBezierTo(
        width * 0.3, height * 0.4, width * 0.5, height * 0.32);

    bottomCircle.quadraticBezierTo(width * 0.75, height * 0.2, width * 0.55, 0);
    bottomCircle.lineTo(0, 0);
    bottomCircle.close();

    canvas.drawPath(bottomCircle, paint);
    canvas.drawPath(bottomCircle, borderPaint);

    // Top circle------------------------------------------------------
    Path topCircle = Path();
    // Start paint at 0, 0 coordinates
    topCircle.moveTo(0, 0);
    // Draw the curve first half
    topCircle.quadraticBezierTo(
        width * 0.15, height * 0.2, width * 0.5, height * 0.20);
    // Draw the curve second half
    topCircle.quadraticBezierTo(width * 0.85, height * 0.2, width, 0);
    topCircle.close();
    // ----------------------------------------------------------------

    canvas.drawPath(topCircle, paint);
    canvas.drawPath(topCircle, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
