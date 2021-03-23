import 'package:flutter/material.dart';

class Needle extends StatelessWidget {
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double thickness;
  final Color color;
  final Widget child;

  const Needle({
    Key key,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.thickness = 4,
    this.color = Colors.red,
    this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeedlePainter(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          thickness: thickness,
          color: color),
      size: MediaQuery.of(context).size,
      child: child != null ? child : Container(),
    );
  }
}

class NeedlePainter extends CustomPainter {

  final Color color;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double thickness;

  const NeedlePainter({this.color, this.top, this.bottom, this.left, this.right, this.thickness});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = thickness;

    final path = Path()
      ..moveTo(size.width / 2 - 2, size.height / 2)
      ..lineTo(size.width / 2 + 2, size.height / 2)
      ..lineTo(size.width / 2 + 2, top)
      ..lineTo(size.width / 2 - 2, top);
    canvas.drawShadow(path, color, 5, true);

    final p1 = Offset(size.width / 2 - left + right, 0 + top);
    final p2 = Offset(size.width / 2 - left + right, size.height - bottom);
    canvas.drawLine(p1, p2, paint);
    canvas.drawCircle(
        Offset(size.width / 2 - left + right, 0 + top), thickness / 2, paint);
    canvas.drawCircle(
        Offset(size.width / 2 - left + right, size.height - bottom),
        thickness / 2,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}