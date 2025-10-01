import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchIcon extends StatelessWidget {
  final Color color;
  final double? size;

  const CustomSearchIcon({
    super.key,
    required this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? 16.sp;
    
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: CustomPaint(
        painter: SearchIconPainter(color: color),
      ),
    );
  }
}

class SearchIconPainter extends CustomPainter {
  final Color color;

  SearchIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the circle (search lens)
    final center = Offset(size.width * 0.4, size.height * 0.4);
    final radius = size.width * 0.25;
    canvas.drawCircle(center, radius, paint);

    // Draw the handle (search handle)
    final handleStart = Offset(
      center.dx + radius * 0.7,
      center.dy + radius * 0.7,
    );
    final handleEnd = Offset(
      size.width * 0.85,
      size.height * 0.85,
    );
    canvas.drawLine(handleStart, handleEnd, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
