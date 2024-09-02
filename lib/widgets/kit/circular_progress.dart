import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';

class KitCircularProgress extends StatelessWidget {
  const KitCircularProgress({
    super.key,
    required this.progress,
    this.child,
  });

  final Widget? child;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircularProgressPainter(
        color: appTheme.colors.elements.blue,
        progress: progress,
      ),
      child: (child != null)
          ? Center(
              child: child,
            )
          : null,
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  _CircularProgressPainter({
    required this.color,
    required this.progress,
  });

  final double progress; // = 2 / 3;
  final Color color;

  double get _sweepAngle => 2 * 3.14159265359 * progress;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = color.withAlpha(40)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Paint foregroundPaint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Paint capPaint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Рисуем фон круга
    canvas.drawArc(
      Offset.zero & size,
      0,
      2 * 3.14159265359,
      false,
      backgroundPaint,
    );

    // Рисуем основной прогресс без закругления в начале
    canvas.drawArc(
      Offset.zero & size,
      -3.14159265359 / 2,
      _sweepAngle - 0.01, // Немного меньше, чтобы избежать закругления в начале
      false,
      foregroundPaint,
    );

    // Добавляем маленькую дугу в конце с закруглением
    canvas.drawArc(
      Offset.zero & size,
      -3.14159265359 / 2 + _sweepAngle - 0.01,
      0.01, // Маленький угол для закругления конца
      false,
      capPaint,
    );
  }
}
