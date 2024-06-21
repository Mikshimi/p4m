import 'package:flutter/material.dart';

class LineAnimation extends StatefulWidget {
  final String letter;
  final VoidCallback onAnimationComplete;

  const LineAnimation(
      {super.key, required this.letter, required this.onAnimationComplete});

  @override
  // ignore: library_private_types_in_public_api
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
      duration: const Duration(seconds: 3),
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
      width: 70,
      height: 70,
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
      ..color = const Color.fromARGB(255, 255, 174, 0).withOpacity(0.8) 
      ..strokeWidth = 2.0
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
        path.moveTo(size.width, size.height);
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
