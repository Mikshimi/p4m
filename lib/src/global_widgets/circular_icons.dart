import 'package:flutter/material.dart';

class CircularIcons extends StatelessWidget {
  
  final Color color;
  final IconData iconData;
  final Function onPressed;
  final Function onLongPress;

  const CircularIcons({super.key, required this.color, required this.iconData,  required this.onPressed, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
        color: color),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: () => onPressed,
          onLongPress: () => onLongPress,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}
