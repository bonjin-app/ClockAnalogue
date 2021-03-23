import 'package:flutter/material.dart';

class Pin extends StatelessWidget {
  final Alignment alignment;
  final double radius;
  final Color color;
  final Widget child;

  const Pin({Key key,
        this.alignment = Alignment.center,
        this.radius = 10,
        this.color = Colors.black,
        this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PinPainter(alignment: alignment, radius: radius, color: color),
      size: MediaQuery.of(context).size,
    );
  }
}

class PinPainter extends CustomPainter {

  final Alignment alignment;
  final Color color;
  final double radius;

  const PinPainter({this.alignment, this.color, this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;

    Offset center;
    if (alignment == Alignment.center) {
      center = Offset(size.width / 2, size.height / 2);
    } else if (alignment == Alignment.bottomCenter) {
      center = Offset(size.width / 2, size.height);
    } else if (alignment == Alignment.topCenter) {
      center = Offset(size.width / 2, 0);
    } else {
      center = Offset(0, 0);
    }
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}