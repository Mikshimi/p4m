import 'package:flutter/material.dart';

class AnimatedUnderSingle extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Color textColor;
  final Color underlineColor;
  final double fontSize;

  // ignore: use_super_parameters
  const AnimatedUnderSingle({
    Key? key,
    required this.text,
    required this.isSelected,
    this.textColor = Colors.black,
    this.underlineColor = Colors.blue,
    this.fontSize = 24.0,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedUnderSingleState createState() =>
      _AnimatedUnderSingleState();
}

class _AnimatedUnderSingleState extends State<AnimatedUnderSingle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.only(top: 5.0),
          height: 2.0,
          width: widget.isSelected ? _calculateTextWidth(widget.text) : 0.0,
          color: widget.isSelected ? widget.underlineColor : Colors.transparent,
        ),
      ],
    );
  }

  double _calculateTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: widget.fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }
}

/*
  use case: 
  AnimatedUnderlineText(
  text: 'Some Heading',
  isSelected: true, // or false based on your logic
  textColor: Colors.red,
  underlineColor: Colors.red,
  fontSize: 28.0,
)

*/