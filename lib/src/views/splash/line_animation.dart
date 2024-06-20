import 'package:flutter/material.dart';

class LineAnimation extends StatefulWidget {
  final String letter;
  final VoidCallback onAnimationComplete;

  const LineAnimation(
      {Key? key, required this.letter, required this.onAnimationComplete})
      : super(key: key);

  @override
  _LineAnimationState createState() => _LineAnimationState();
}

class _LineAnimationState extends State<LineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Increase duration to 3 seconds
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50, // Adjust as needed for your design
      height: 50, // Adjust as needed for your design
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: _LetterPainter(widget.letter, _animation.value),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _LetterPainter extends CustomPainter {
  final String letter;
  final double progress;

  _LetterPainter(this.letter, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400 // Use a lighter color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    switch (letter) {
      case 'P':
        path.moveTo(0, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(0, size.height / 2);
        break;
      case '4':
        path.moveTo(size.width, size.height); // Adjust to correct the inversion
        path.lineTo(size.width, 0);
        path.lineTo(0, size.height / 2);
        path.lineTo(size.width, size.height / 2);
        break;
      case 'M':
        path.moveTo(0, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width / 2, size.height / 2);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        break;
    }

    if (path.computeMetrics().isNotEmpty) {
      final metrics = path.computeMetrics().first;
      final extractPath = metrics.extractPath(0.0, metrics.length * progress);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(_LetterPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
