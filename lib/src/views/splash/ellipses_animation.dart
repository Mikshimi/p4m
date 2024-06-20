import 'package:flutter/material.dart';

class EllipsesAnimation extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const EllipsesAnimation({Key? key, required this.onAnimationComplete}) : super(key: key);

  @override
  _EllipsesAnimationState createState() => _EllipsesAnimationState();
}

class _EllipsesAnimationState extends State<EllipsesAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjust duration as needed
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onAnimationComplete();
        }
      });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.blue.withOpacity(_controller.value),
                ),
              );
            }),
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
