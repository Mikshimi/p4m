import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  bool? softwrap;
  String? fontFamilyChoice;
  TextOverflow? overflow;

  CustomText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.softwrap,
      this.fontFamilyChoice, 
      this.overflow
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softwrap?? false,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 20,
        fontWeight: weight == null ? FontWeight.w400 : FontWeight.w500,
        fontFamily: fontFamilyChoice ?? 'Roboto',
        overflow: overflow ?? TextOverflow.ellipsis 

      ),
    );
  }
}
